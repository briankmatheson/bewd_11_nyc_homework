class MoviesController < ApplicationController
	attr_accessor :title, :description, :year_released

  def index
	@movies = Movie.search_for(params[:q])
  end
end
