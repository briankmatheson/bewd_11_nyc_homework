class StoriesController < ApplicationController
	def index
		@stories = Story.search_for(params[:q])
	end

	def show
		load_story
	end

	def new
		@story=Story.new
	end

	def create
		@story=Story.new(safe_story_params)
		if @story.save
			redirect_to story_path(@story)
		else
			render 'new'
		end
	end

	def edit
		load_story
	end

	def update
		load_story
		@story.update safe_story_params
		redirect_to story_path(@story)
	end
	
	def load_story
		@story = Story.find_by id: params[:id]
	end

	private 
	def safe_story_params
		params.require('story').permit(:title, :category, :link, :upvotes)	
	end
end
