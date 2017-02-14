class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_repo
  before_action :set_user_dashboard

  def current_user
    #possibly add in default new user, look into (null user object) 
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_repo
    @current_repo ||= Repo.find(session[:repo_id]) if session[:repo_id]
  end

  def set_user_dashboard
    @user_dashboard = UserDashboard.new(user: current_user)
  end
end
