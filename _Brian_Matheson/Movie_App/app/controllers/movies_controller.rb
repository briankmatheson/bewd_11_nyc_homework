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

  def edit
    @movie = Movie.search(params[:id])
    @movie.title = params[:title]
    @movie.year_released = params[:year_released]
    @movie.description = params[:description]
    @movie.save
  end    

  def new
    movie = Movie.new
    movie.title = params[:title]
    movie.year_released = params[:year_released]
    movie.description = params[:description]
    movie.save
  end

end
