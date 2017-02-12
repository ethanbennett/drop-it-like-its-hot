class ReposController < ApplicationController

  def index
    @content = current_user.repos.where(repo_id: current_repo)
  end

  def show
    @content = current_user.repos.where(repo_id: params[:id])
  end

end