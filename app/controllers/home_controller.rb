class HomeController < ApplicationController

  def index
    session[:repo_id] = nil
    @repo = Repo.new
    @repos = Repo.where(repo_id: nil)
  end
  
  def show
    @repo = Repo.new
    @repos = current_user.repos.where(repo_id: current_repo)
  end

end