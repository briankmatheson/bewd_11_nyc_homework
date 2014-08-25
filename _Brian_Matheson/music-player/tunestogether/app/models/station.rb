class Station < ActiveRecord::Base
  belongs_to :user

  def stream (playlist)
    # start the streaming server if not already running
    system "test -e /tmp/playing.#{self.id} || lib/tasks/stream.rb #{playlist.id} #{self.id} &"
  end
  def kill
    # kill the streaming server if running
    system "kill `cat /tmp/playing.#{self.id}`"
  end
end
