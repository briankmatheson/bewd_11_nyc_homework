class MoviesController < ApplicationController
	def index
		@movies = Movie.all
	end

	#def show_movies 
	#	@titles = Movie.all
	#end


end
