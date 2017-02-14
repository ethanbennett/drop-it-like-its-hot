class ReposController < ApplicationController

  def show
    session[:repo_id] = params[:id]
    redirect_to home_path
  end

  def create
    current_user.repos.create(repo_params)
    current_repo.repos << repo if current_repo
    redirect_to home_index_path
  end
  
  private

    def repo_params
      params.require(:repo).permit(:aws_url)
    end

end