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
   
    array = IO.readlines "config/stream.conf"
    string = array.join
    hash = JSON.parse(string, {symbolize_names:true})
    hash[:format] = Shout::MP3
    @shout = Shout.new (hash)
    
    @shout.mount = station
    @shout.connect
    playlist_songs = PlaylistSong.where(playlist_id:playlist_arg)
    system "echo `date` playing pid: #{$$} song count: #{playlist_songs.count} >> /tmp/playing.log"

    while playlist_songs.count >= 0 do
      song = playlist_songs.first.song
      url = "http://localhost:3000/#{song.data_url}"
      
      response = RestClient.get(url)

      @meta = ShoutMetadata.new
      # @meta.add 'artist', artist
      # @meta.add 'title', name
      #@shout.metadata = @meta
      system "echo `date` playing pid: #{$$} url: #{url} >> /tmp/playing.log"

      chunk_size = 65536
      #chunk_size = 1024
      first_byte = 0
      last_byte = first_byte + chunk_size - 1
      while last_byte < response.to_str.size do 
        system "echo `date` playing pid: #{$$} chunk: #{first_byte} >> /tmp/playing.log"
        chunk = response.to_str[first_byte..last_byte]
        @shout.send chunk
        @shout.sync
        first_byte += chunk_size
        last_byte += chunk_size
      end
      chunk = response.to_str[first_byte..response.to_str.size]
      @shout.send chunk
      @shout.sync
      playlist_songs.first.delete
      playlist_songs.save
    end
    @shout.disconnect
  end
end

Signal.trap(0, proc { system "rm /tmp/playing.#{ARGV[1]} && echo `date` end pid: #{$$} args: #{ARGV} >> /tmp/playing.log"})

system "echo #{$$} > /tmp/playing.#{ARGV[1]}"
system "echo `date` start pid: #{$$} args: #{ARGV} >> /tmp/playing.log"
stream = Stream.new
stream.send(ARGV)

