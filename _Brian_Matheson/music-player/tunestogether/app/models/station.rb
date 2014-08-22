class Station < ActiveRecord::Base
  require "ruby-shout"

  def stream_file (filename, artist, name)
    @blocksize = 16384
    @shout = Shout.new ({ 
      :host => "localhost",
      :port => 8000,
      :user => "source",
      :pass => "gr8passwd",
      :format => Shout::MP3 })
    @meta = ShoutMetadata.new
    @meta.add 'filename', filename
    @meta.add 'artist', artist
    @meta.add 'title', name
  end
end
