class MoviesController < ApplicationController
	attr_accessor :title, :description, :year_released

  def index
    @movies = Movie.search_for(params[:q])
  end

  def show
    @movie = Movie.find_by id: params[:id]
  end

  def initialize #(title, description)
    @title = title
    @description = description
    @year_released = year_released
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

  def edit
    load_movie
  end

  def update
    load_movie
    @movie.update safe_movie_params

    redirect_to movie_path(@movie)
  end

  private 
  def safe_movie_params
    params.require('movie').permit(:title, :description, :year_released)
  end

  def load_movie
    @movie = Movie.find_by id: params[:id]
  end

  # def index
  #   @movies = Movie.all

    # POSSIBLE? @movies = Movie.search_for(title[:title])

    # { |e|  }
    # Movie.find_each do |title, description, year|
    #   puts "#{title}\n"
    # end
end

    # @movies[:title] ?

  	# CreateMovies = []
  	# CreateMovies
  	# return CreateMovies.all
  # @movies = CreateMovies.all

	# Movies.each do |title|
 #  		puts "#{title}\n"
 #  	end


  # class Movies_List
  # attr_accessor :title, :description, :year_released

		# def initialize(title, description, year_released)
		# 	@title = title
		# 	@description = description
		# 	@year_released = year_released
		# end

  	# Movies(title).each do |title|
  	# 	return title
  	# end
  
 # end
