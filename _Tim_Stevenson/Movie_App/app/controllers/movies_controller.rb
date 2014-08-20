class MoviesController < ApplicationController
	attr_accessor :title, :description, :year_released

  def index
	@movies = Movie.search_for(params[:q])
  end

  def show
  	load_movie
  end

  def new
  	@movie = Movie.new
  end

  def create
  	@movie = Movie.new(safe_movie_params)
  	if @movie.save
  		redirect_to movie_path(@movie)
  	else
  		render 'new'
  	end
  end

  private 
  def safe_movie_params
    params.require('movie').permit(:title, :description, :year_released)
  end  

  def load_movie
  	@movie = Movie.find_by id: params[:id]
  end
end
