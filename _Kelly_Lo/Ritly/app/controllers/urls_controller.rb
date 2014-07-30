class UrlsController < ApplicationController
	
	def new
	@url=Url.new
	end

	def create
		@url=Url.new(safe_url_params)
		
	end

	def show
	end

	private
	def safe_url_params
		params.require(:url).permit(:link)
	end
end
