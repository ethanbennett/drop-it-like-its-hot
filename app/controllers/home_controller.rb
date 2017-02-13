class HomeController < ApplicationController
  # before_action :set_s3_direct_post, only: [:index]



  def index
    @repo = Repo.new
    @repos = Repo.where(repo_id: current_repo)
    @s3_direct_post = Repo.set_s3_direct_post
  end

end