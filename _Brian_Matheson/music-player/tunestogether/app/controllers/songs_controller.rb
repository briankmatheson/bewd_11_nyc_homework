class SongsController < ApplicationController
  helper_method :enqueue

  def new
  end
  def create
  end
  def show
    @song = Song.find(params[:id])
    @station = current_user.station.id
    enqueue(@song.data_url, @song.artist, @song.name, @station)
    redirect_to songs_path
  end
  def index
    @user =  current_user
    @songs = @user.songs.all
    @station = @user.station.id
  end
  def enqueue (url, artist, name, station_id)
    station = Station.new()
    station.stream_file(url, artist, name, station_id)
  end
end
