class UsersController < ApplicationController
before_filter :authenticate_user!, only: [:show, :index]

	def new
		@user = User.new
	end

	def create
		# safe_user_params = params.require(:user).permit(:username, :password)
		@password = params[:user][:password]
		@username = params[:user][:username]
		
		@user = User.create_with_password(@username, @password)
		flash[:error] = "Your info is #{@user.username} and #{@user.password}"
		# redirect_to new_session_path
		# redirect_to sessions_path
		redirect_to :controller => 'sessions', :action => 'create', :username => @username, :password => @password
	end

	def show
		@user = User.find params[:id]
	end

	# def edit
	# 	@user = User.find params[:id]
	# end

	# def update
	# 	@user = User.find params[:id]
	# end

	def index
		@users = User.all
	end

private
	def find_user(id)
		
	end


end
