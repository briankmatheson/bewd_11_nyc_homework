class UrlsController < ApplicationController
  def index
  	@url = Url.all
  end

  # def show
  #   load_url
  # end

  def new
    @url = Url.new
  end

	# def generate_hash_code
	# 	@hash_code = rand(10000)
	# end

  def create
	def generate_hash_code
		@hash_code = rand(10000)
	end  	
    @url = Url.new(safe_url_params)
    if @url.save
      redirect_to url_path(@url)
    else
      render 'new'
    end
  end

  # def edit
  #   load_url
  # end

  # def update
  #   load_shirt
  #   @shirt.update safe_shirt_params

  #   redirect_to shirt_path(@shirt)
  # end

  private 
  def safe_url_params
    params.require('url').permit(:link)
  end


  # def load_url
  #   @url = Url.find_by id: params[:id]
  # end

end
