class Playlist < ActiveRecord::Base
  belongs_to :user
  has_many :playlist_songs
  has_many :songs, through: :playlist_songs, source: :song

  def push(song)
    playlist_song = PlaylistSong.create(playlist_id:self.id, song_id:song.id)
    playlist_song.save
  end
end
