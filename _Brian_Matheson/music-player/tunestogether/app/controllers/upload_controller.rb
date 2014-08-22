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
#    @file.file = params[:data_file][:file]
    @file.save
  end

private
  def upload_params
#    params.permit(:utf8, :authenticity_token, :data_file, :@original_filename, :@content_type, :@headers, :commit)
    params.permit(:data_file, :@original_filename, :@content_type, :@headers,)
  end
end
