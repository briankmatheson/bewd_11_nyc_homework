class MoviesController < ApplicationController
  def index
  	@movie_search = Movie.search_for(params[:q])
  	# Is there a way to only show results if a search has been performed?
  end

  def new
  	# Required for checking the result of @movie.save
  	# Otherwise @movie would be nil in the view, and calling movie.erros.any? would throw an error
  	@movie = Movie.new
  end

  def edit
  	@movie = Movie.find(params[:id])
  end

  def update
  	@movie = Movie.find(params[:id])

  	if @movie.update(movie_params)
  		redirect_to @movie
  	else
  		render "edit"
  	end

  	# The method update, is used when you want to update a record that already exists. It accepts a hash containing the attributes that you want to update.

  end

  def create

  	# render plain: params[:movie].inspect
  	# The render method is taking a very simple hash with the key of plain and the value of params[:movie].inspect

  	@movie = Movie.new(movie_params)

  	# Check the result of @movie.save
  	if @movie.save
  		redirect_to @movie
  	else 
  		render "new"
  		# If @movie.save returns false, show the form back to the user
  	end

  end


  def show
  	@movie = Movie.find(params[:id])
  end

  private
  	def movie_params
  		params.require(:movie).permit(:title, :description, :year_released)
  	end

end
