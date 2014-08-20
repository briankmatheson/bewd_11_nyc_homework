class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  helper_method :current_user, :logged_in?

  # like rails server within website display
  
  def current_user
    return nil unless session[:user_id].present? 
    User.find_by id:session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def authenticate_user!
    unless logged_in?
      flash[:error] = "Sorry you must be logged in to do this..."
      redirect_to new_session_path
    end
  end
  
end
