class HomeController < ApplicationController

  def index
    @user_dashboard = UserDashboard.new(user: current_user)
    @repo = Repo.new
    @repos = Repo.where(repo_id: nil)
    @s3_direct_post = Repo.set_s3_direct_post
  end

  def show
    @repo = Repo.new
    @repos = current_user.repos.where(repo_id: current_repo)
  end
end
