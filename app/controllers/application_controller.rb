class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
 # add_flash_types :error, :success
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def logged_in?
    !!current_user
  end
  def require_user
    if !logged_in? 
      flash[:error] = "You are only allow to perform that task after login"
      redirect_to login_path
    end
  end
end
