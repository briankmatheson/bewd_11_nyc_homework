class MoviesController < ApplicationController
  def index 
    @movies = Movie.search_for(params[:q])
  end

  def show
  	show_movie
  end


 def search
 	show_movie
 end

 def new
 	@movies = Movie.new
 end

 def edit
 	show_movie
 end

 def create
 	show_movie
 	#redirect_to @movies(:id)
 end


private
def show_movie
	#@movies = Movie.search_for(params[:q])
	@movies = Movie.find_by id: params[:id]
	#raise
end



end
