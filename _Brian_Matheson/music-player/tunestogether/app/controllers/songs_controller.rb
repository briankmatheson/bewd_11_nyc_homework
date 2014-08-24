class SongsController < ApplicationController
  helper_method :enqueue
  helper_method :change_station
  helper_method :list_stations

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
    @songs = @user.songs.all
    @station = Station.find(@user.current_station)
    @stations = list_stations
  end
  def enqueue (url, artist, name)
    station = Station.find(current_user.station)
    station.stream_file(url, artist, name)
  end
  def list_stations
    User.all.map {|user| user.handle}
  end
  def change_station
    handle = params[:handle]
    listen_to_user = User.where(handle:handle).first

    current_user.set_current_station(listen_to_user.station.id)

    redirect_to songs_path
  end

  private
  def change_params
        params.permit(:handle)
  end
end
