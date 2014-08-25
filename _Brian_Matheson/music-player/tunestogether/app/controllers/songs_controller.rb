class SongsController < ApplicationController
  before_filter :authenticate_user!
  helper_method :enqueue
  helper_method :change_station
  helper_method :list_stations
  helper_method :cache_buster

  def new
  end
  def create
  end
  def show
    @song = Song.find(params[:id])
    @playlist = Playlist.find(current_user.current_playlist)
    enqueue(@song, @playlist)
  end
  def index
    @user =  current_user
    @songs = @user.songs.all
    @station = Station.find(@user.current_station)
    @stations = list_stations
    @playlist_id = current_user.current_playlist
    @playlist = Playlist.find(@playlist_id)
    @playlist_songs = PlaylistSong.where(playlist_id:@playlist_id)
  end
  def enqueue (song, playlist)
    playlist.push song 
    redirect_to songs_path
  end

  def dequeue
    PlaylistSong.find(dequeue_params["format"]).delete
    redirect_to songs_path
  end    

  def list_stations
    stations_list = User.all.map {|user| user.handle}
    stations_list.unshift Station.find(current_user.current_station).user.handle
  end
  def change_station
    handle = params[:handle]
    listen_to_user = User.where(handle:handle).first

    current_user.set_current_station(listen_to_user.station.id)
    redirect_to songs_path
  end
  def start
    @playlist_id = current_user.current_playlist
    @playlist = Playlist.find(@playlist_id)
    Station.find(current_user.station).stream(@playlist)
    redirect_to songs_path
  end
  def stop
    Station.find(current_user.station).kill
    redirect_to songs_path
  end

  private
  def change_params
        params.permit(:handle)
  end
  def dequeue_params
    params.permit("format")
  end
end
