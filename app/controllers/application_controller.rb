class ApplicationController < ActionController::Base
  def require_sign_in
    redirect_to login_path unless current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  protect_from_forgery with: :exception

  helper_method :current_user
end
