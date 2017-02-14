class AccountController < ApplicationController
  def index
    @user_dashboard = UserDashboard.new(user: current_user)
    @user = @user_dashboard.user
  end
end