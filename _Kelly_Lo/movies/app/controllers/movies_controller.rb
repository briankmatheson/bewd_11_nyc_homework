class MoviesController < ApplicationController
  def index
    @movies= Movie.search_for(params[:q])
  end

  def show
  	@movie=Movie.find(params[:id])
  end

  def new
  	@movie = Movie.new
  end

  def edit
  	@movie=Movie.find(params[:id])
  end

  def create
  	@movie=Movie.new(safe_movie_params)
  	if @movie.save 
  		redirect_to movie_path(@movie)
  		else 
  		render 'new'
  	end
  end 

  def load_movie
  	@movie=Movie.find(params[:id])
  end

  def update
  	@movie=Movie.find(params[:id])
  	@movie.update safe_movie_params
  	redirect_to movie_path(@movie)
  end 
  
  private 
  def safe_movie_params
  	params.require('movie').permit(:title, :description, :year_released)
  end 
end
