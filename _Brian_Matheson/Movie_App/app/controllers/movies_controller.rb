class MoviesController < ApplicationController

  def index
    if params[:q]
      @movie = Movie.search(params[:q])
    else
      @movie = Movie.all
    end
  end

  def show
  end

  def new
  end

  def update
    @movie = Movie.search(params[:id])
    movie.update safe_movie_params
    if @movie.save
      redirect_to movie_path(movie)
    else
      render 'new'
    end
  end    

  def create
    movie = Movie.new(safe_movie_params)
    movie.save

    redirect_to movie_path(movie)
  end

  private
  def safe_movie_params
    params.require('movie').permit(:title, :description, :year_released)
  end

end
