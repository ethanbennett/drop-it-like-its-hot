class HomeController < ApplicationController

  # def show
  #   @user_dashboard = UserDashboard.new(user: current_user)
  #   @repo = Repo.new
  #   @repos = current_user.repos.where(repo_id: current_repo)
  # end

  def index
    @user_dashboard = UserDashboard.new(user: current_user)
    @repo = current_user.repos.new
    @repos = Repo.where(repo_id: nil)
    @repos = current_repo.repos if current_repo
    @s3_direct_post = Upload.to_s3
  end
end
