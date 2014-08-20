class SessionsController < ApplicationController

	def new
  end

  def create
    @user = Session.find_authenticated_user(params[:user_name], params[:password])
    if @user.present?
      flash[:notice] = "Welcome back #{@user.user_name}!"
      session[:user_id] = @user.id
      redirect_to url_path
    else
      flash[:error] = "Invalid username or password."
      redirect_to new_session_path
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to url_path
  end

end
