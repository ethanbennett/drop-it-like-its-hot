class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_repo
  before_action :set_user_dashboard, :authorize!

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_repo
    @current_repo ||= Repo.find(session[:repo_id]) if session[:repo_id]
  end

  def set_user_dashboard
    @user_dashboard = UserDashboard.new(user: current_user)
  end

  def authorize!
    return true if session[:admin_id]
    unless authorized?
      redirect_to root_url, danger: "You are not allowed to access this page"
    end
  end

  def authorized?
    Permission.new(current_user, params[:controller], params[:action]).authorized?
  end
end
