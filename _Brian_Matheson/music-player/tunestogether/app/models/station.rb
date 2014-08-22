class Station < ActiveRecord::Base
  require "shout"
  require "open-uri"

  def stream_file (url, artist, name)
    @blocksize = 16384
    @shout = Shout.new ({ 
      :host => "localhost",
      :port => 8000,
      :user => "source",
      :pass => "gr8passwd",
      :format => Shout::MP3 })
    @meta = ShoutMetadata.new
    @meta.add 'artist', artist
    @meta.add 'title', name

    @shout.mount = 'stream'
    @shout.connect
    @shout.metadata = @meta

    data = open("http://localhost:3000#{url}")
    
    @shout.send data
    @shout.sync
  end
end
