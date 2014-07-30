class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :active_session?, :access_denied

  def current_user
    if session[:user_id].present?
      return Users.find_by(id:session[:user_id])
    else
      return nil
    end
  end

  def active_session?
    current_user.present?
  end

  def access_denied
    if ! active_session?
      flash[:error] = "Access Denied"
      redirect_to new_session_path
    end
  end
end
