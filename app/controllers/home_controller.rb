class HomeController < ApplicationController
  # before_action :set_s3_direct_post, only: [:index]
  def show
    @repo = Repo.new
    @repos = current_user.repos.where(repo_id: current_repo)
  end

  def index
    session[:repo_id] = nil
    @repo = Repo.new
    @repos = Repo.where(repo_id: nil)
    @s3_direct_post = Repo.set_s3_direct_post
    #set_upload_to_s3
  end
end