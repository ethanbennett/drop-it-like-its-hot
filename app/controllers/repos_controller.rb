class ReposController < ApplicationController

  def show
    session[:repo_id] = params[:id]
    redirect_to home_index_path
  end

  def create
    repo = Repo.new(repo_params)
    current_user.repos << repo
    current_repo.repos << repo
    redirect_to home_index_path
  end
  
  private

    def repo_params
      params.require(:repo).permit(:aws_url)
    end

end