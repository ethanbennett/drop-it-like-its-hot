class HomeController < ApplicationController

  def show
    @repo = Repo.new
    @repos = current_user.repos.where(repo_id: current_repo)
  end

  def index
    @user_dashboard = UserDashboard.new(user: current_user)
    @repo = Repo.new
    @repos = Repo.where(repo_id: nil)
    @s3_direct_post = Upload.to_s3
  end
  end
end
