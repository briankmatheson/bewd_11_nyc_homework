#!/usr/bin/env ruby

require "shout"
require "rest_client"
require 'sqlite3'
require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'db/development.sqlite3'
)

load 'app/models/playlist.rb'
load 'app/models/song.rb'
load 'app/models/playlist_song.rb'

class Stream
  def send(args)
    playlist_arg = args[0].to_i
    station = args[1]
   
    playlist = Playlist.where(id:playlist_arg).first
    songs = playlist.songs

    array = IO.readlines "config/stream.conf"
    string = array.join
    hash = JSON.parse(string, {symbolize_names:true})
    hash[:format] = Shout::MP3
    @shout = Shout.new (hash)
    
    @shout.mount = station
    @shout.connect
    songs.each do |song|
      url = song.url
      
      response = RestClient.get(url)

      @meta = ShoutMetadata.new
      # @meta.add 'artist', artist
      # @meta.add 'title', name
      #@shout.metadata = @meta

      chunk_size = 65536
      #chunk_size = 1024
      first_byte = 0
      last_byte = first_byte + chunk_size - 1
      while last_byte < response.to_str.size do 
        chunk = response.to_str[first_byte..last_byte]
        @shout.send chunk
        @shout.sync
        first_byte += chunk_size
        last_byte += chunk_size
      end
      chunk = response.to_str[first_byte..response.to_str.size]
      @shout.send chunk
      @shout.sync
    end
    @shout.disconnect
  end
end

system "echo #{ARGV[0]} #{ARGV[1]} > /tmp/playing"
stream = Stream.new
stream.send(ARGV)
system "rm /tmp/playing"

