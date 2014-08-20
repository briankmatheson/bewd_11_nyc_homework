class UrlsController < ApplicationController

	def index
		@urls = Url.all
	end

	def create
		@url = Url.new_with_hash(safe_url_params)
	    # @url = Url.new(safe_url_params)

	    if @url.save
	      redirect_to url_path(@url)
	    else
	      render 'new'
	    end		
	end

	def new
		@url = Url.new
	end

	def show
		load_url
		@full_path = "#{request.protocol}#{request.host_with_port}/#{@url.hash_code}"
	end

	def redirectors
		@url = Url.find_by hash_code: params[:code]
		if @url
			redirect_to @url.link
		else
			redirect_to root_path
		end
	end

	def preview

	end

  private 
  def safe_url_params
    params.require(:url).permit(:link)
  end

  def load_url
  	@url = Url.find_by id: params[:id]
  end

end
