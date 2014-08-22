class UploadController < ApplicationController
  def index
    @upload = DataFile.new()
  end
  def show
  end
  def new
  end
  def create
    @file = DataFile.create(upload_params)
    @file.file = params[:data_file][:file]
    @file.save
    @user =  current_user
    @song = Song.import_new_song(@file.file.path, @file.file.url, @user)
    redirect_to songs_path
  end

private
  def upload_params
#    params.permit(:utf8, :authenticity_token, :data_file, :@original_filename, :@content_type, :@headers, :commit)
    params.permit(:data_file, :@original_filename, :@content_type, :@headers,)
  end
end
