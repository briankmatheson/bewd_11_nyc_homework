#!/usr/bin/env ruby

require "shout"
require "rest_client"

  def send(playlist, station)
    playlist = IO.readlines("/tmp/playlist.txt")

    url = playlist.shift

    response = RestClient.get(url)
    
    @shout = Shout.new ({ 
                          :host => "localhost",
                          :port => 8000,
                          :user => "source",
                          :pass => "gr8passwd",
                          :format => Shout::MP3 })
    @meta = ShoutMetadata.new
    # @meta.add 'artist', artist
    # @meta.add 'title', name
    
    @shout.mount = station
    @shout.connect
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
    
    @shout.disconnect
  end

system "echo #{ARGV[0]} #{ARGV[1]} > /tmp/playing"
send(ARGV[0], ARGV[1])
system "rm /tmp/playing"

