class SongsController < ApplicationController
  helper_method :enqueue_and_listen

  def new
  end
  def create
  end
  def show
    @song = Song.find(params[:id])
    enqueue_and_listen(@song.data_url, @song.artist, @song.name)
    return "http://localhost:8000/"
  end
  def index
    @user =  current_user
    @songs = @user.songs.all
  end
  def enqueue_and_listen (filename, artist, name)
    station = Station.new()
    station.stream_file(filename, artist, name)
  end
end
