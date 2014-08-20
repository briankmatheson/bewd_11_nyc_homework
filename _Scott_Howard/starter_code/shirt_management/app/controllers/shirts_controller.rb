class ShirtsController < ApplicationController
  def index
    @shirts = Shirt.search_for(params[:q])
  end

  def show
    load_shirt
  end

	def new
		@shirt = Shirt.new
	end

	def create
		@shirt = Shirt.new(safe_shirt_params)
		if @shirt.save
			redirect_to shirt_path(@shirt)
		else
			render 'new'
		end
	end

	def edit
		load_shirt
	end

	def update
		load_shirt
		@shirt.update safe_shirt_params
		redirect_to shirt_path(@shirt)
	end

	private #only internal, not exposed to world
	def safe_shirt_params
			#grabs shirts param hash
			params.require('shirt').permit(:name, :description, :image) 
	end

	def load_shirt
		@shirt = Shirt.find_by id: params[:id]
	end

end

