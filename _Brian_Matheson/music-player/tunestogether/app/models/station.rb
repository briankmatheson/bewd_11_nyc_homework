class Station < ActiveRecord::Base
  belongs_to :user

  def stream_file (url, artist, name, station_rand)
    system "echo http://localhost:3000#{url} > /tmp/playlist.txt"
    system "test -e /tmp/playing || lib/tasks/stream.rb /tmp/playlist.txt #{station_rand}&"
  end
end
