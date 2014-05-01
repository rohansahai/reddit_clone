class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :signed_in?, :current_user

  def sign_in
    session[:token] = @user.token!
  end

  def sign_out
    current_user.token!
    session[:token], @current_user = nil
  end

  def signed_in?
    !!current_user
  end

  def current_user
    return nil unless session[:token]
    @current_user ||= User.find_by_token(session[:token])
  end

end
