class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :authorize

  protected

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def authorize
    unless current_user
      redirect_to login_url, notice: "Please login"
    end
  end

end
