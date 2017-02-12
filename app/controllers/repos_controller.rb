class ReposController < ApplicationController

  def index
    @content = current_user.repos.where(repo_id: current_repo)
  end

  def show
    @content = current_user.repos.where(repo_id: params[:id])
  end

  def create
    repo = Repo.new(repo_params)
    if repo.save
      redirect_to home_index_path
    end
  end

  private

    def repo_params
      params.require(:repo).permit(:aws_url)
    end

end