class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movies = Movie.all
  end

  def new
  end

  def edit
  end

  def update
  end
end
