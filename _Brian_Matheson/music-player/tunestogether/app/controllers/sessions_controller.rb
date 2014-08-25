class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_with_hashed_password(login_params)
    if @user.present?
      session[:user_id] = @user.id
      redirect_to songs_path
    else
      redirect_to new_session_path
    end
  end
  def destroy
    Station.find(current_user.current_station).kill
    session[:user_id] = nil
    redirect_to root_path
  end

  private
  def login_params
    params.permit(:handle, :password)
  end
end
