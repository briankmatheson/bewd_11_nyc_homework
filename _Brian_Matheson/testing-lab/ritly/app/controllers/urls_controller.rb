class UrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def create
    safe_url_params = params.require(:url).permit(:link)
    @url = Url.create safe_url_params
    redirect_to @url
  end

  def show
    @url = Url.find params[:id]
    @full_path = "#{request.protocol}#{request.host_with_port}/#{@url.hash_code}"
  end

  def redirector
    @url = Url.find_by hash_code: params[:code]
    if @url
      redirect_to @url.link
    else
      redirect_to root_path
    end
  end

  def preview
    @url = Url.find_by hash_code: params[:code]
    unless @url
      redirect_to root_path
    end
  end
end
