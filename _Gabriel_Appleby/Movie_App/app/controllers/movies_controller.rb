class MoviesController < ApplicationController
  def index
  	@movies = Movie.search(params[:q])
  end
  def show
  	@movie = Movie.find(params[:id])
  end
  def new
  	@movie = Movie.new
  end
  def edit
  	@movie = Movie.find(params[:id])
  end
  def create
  	@movie = Movie.new(params.require(:movie).permit(:title, :description, :year_released))

  	@movie.save
  	redirect_to @movie
  end
  def update
  	@movie = Movie.find(params[:id]) 
  	@movie.update(params.require(:movie).permit(:title, :description, :year_released))
  	redirect_to @movie
  end
  def destroy
  	@movie = Movie.find(params[:id])
  	@movie.destroy

  	redirect_to movies_path
  end
end
