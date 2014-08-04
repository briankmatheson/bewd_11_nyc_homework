class MoviesController < ApplicationController
  def index
  	  	 @all_movies = Movie.all
  	  	 @count = 0
  end

end
