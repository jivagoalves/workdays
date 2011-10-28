class ApplicationController < ActionController::Base
  protect_from_forgery
  force_ssl
  
  helper_method :current_user, :signed_in?, :current_user?, :redirect_to_root_path
  
  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def authenticate
    redirect_to signin_path unless signed_in? 
  end
  
  def current_user?(user)
    user == current_user
  end
  
  def redirect_to_root_path
    redirect_to root_path
  end
  
end
