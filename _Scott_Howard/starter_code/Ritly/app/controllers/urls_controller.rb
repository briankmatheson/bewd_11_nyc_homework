class UrlsController < ApplicationController

	def new
		@url = Url.new
	end

	def create
		@url = Url.new(safe_url_params)
		@url.hash_code = rand(1..1000000)
		@url.save
		redirect_to url_path(@url)
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
		@url = Url.find_by hash_code: params[:code]
		unless @url
			redirect_to root_path
		end
	end


	private
	def safe_url_params
		params.require(:url).permit(:link)
	end

	def load_url
		@url = Url.find_by id: params[:id]
	end

end
