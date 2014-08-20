class MoviesController < ApplicationController
	def index
		@movies = Movie.search_for(params[:q])
	end

	def show
		@movie = Movie.find_by id: params[:id]
	end

	def create
		
	end
end
