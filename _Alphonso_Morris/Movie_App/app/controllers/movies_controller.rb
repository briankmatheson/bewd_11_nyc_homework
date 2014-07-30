class MoviesController < ApplicationController
  def index
  	# database call and store the array of objects returned (movies)
  	# into the instance variable @movies.
  	# You need to put it in an instance variable to be able to pass
  	# it into the html.erb
 	@movies = Movie.all 
  end

end