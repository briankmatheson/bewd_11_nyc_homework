class SessionsController < ApplicationController
  def new
  end

  def create
    if @user = Users.find_user(params[:user], params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to new_session_path
    end
  end
  
  def delete
  end
end
