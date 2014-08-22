class SongsController < ApplicationController
  helper_method :enqueue

  def new
  end
  def create
  end
  def show
    @song = Song.find(params[:id])
    enqueue(@song.data_file, @song.artist, @song.name)
    redirect_to "http://localhost:8000/stream"
    return "http://localhost:8000/stream"
  end
  def index
    @user =  current_user
    @songs = @user.songs.all
  end
  def enqueue (filename, artist, name)
    station = Station.new()
    station.stream_file(filename, artist, name)
  end
end
