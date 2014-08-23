class SongsController < ApplicationController
  helper_method :enqueue

  def new
  end
  def create
  end
  def show
    @song = Song.find(params[:id])
    enqueue(@song.data_url, @song.artist, @song.name)
    redirect_to songs_path
  end
  def index
    @user =  current_user
    @user.station.id = rand(100000000)
    @songs = @user.songs.all
  end
  def enqueue (url, artist, name)
    station = Station.new()
    station.stream_file(url, artist, name, @user.station.id)
  end
end
