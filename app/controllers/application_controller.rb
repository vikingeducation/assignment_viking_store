class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def sign_in(user)
    session[:current_user_id] = user.id
    current_user = user
  end

  def sign_out
    session.delete(:current_user_id)
    current_user = nil
    session[:current_user_id].nil? && current_user.nil?
  end

  def current_user
    return nil unless session[:current_user_id]
    @current_user ||= User.find(session[:current_user_id])
  end
  helper_method :current_user

  # set current_user instance variable so don't always have to re-query the database
  def current_user=(user)
    @current_user = user
  end

  # checks general case that someone is signed in
  def signed_in_user?
    !!current_user
  end
  helper_method :signed_in_user?

end
