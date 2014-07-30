class UrlsController < ApplicationController

  def new
    @url = Url.new
  end

  def create
    url = Url.new(safe_url_params)
    random_number = rand(10000000).to_s
    
    url.short_url = random_number

    if url.save
      redirect_to url_path(url)
    else
      render 'new'
    end
  end
  
  def goto
    param = params[:id]
    if url = Url.find_by(short_url: param)
      redirect_to url.link
    else
      render 'index'
    end
  end

  def show
    url = Url.find(params[:id])

    @link = url.link
    @short_url = "http://localhost:3000/goto/#{url.short_url}"
  end

  def index
  end

  private
  def safe_url_params
    params.require('url').permit(:link)
  end
    

end
