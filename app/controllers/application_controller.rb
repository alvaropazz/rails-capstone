class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :login_required, except: [:index]

  def login_required
    return if logged_in?

    flash[:alert] = 'You need to login first!'
    redirect_to new_session_path
  end

  def logged_in?
    !!current_user
  end

  helper_method :logged_in?

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      @current_user
    else
      false
    end
  end

  helper_method :current_user
end
