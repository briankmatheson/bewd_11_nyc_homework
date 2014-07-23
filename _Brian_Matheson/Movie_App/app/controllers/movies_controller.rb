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

end
