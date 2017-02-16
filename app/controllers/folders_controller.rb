class FoldersController < ApplicationController

  def show
    session[:repo_id] = params[:id]
    repo = current_user.repos.find(params[:id])
    redirect_to home_path(repo)
  end

  def create
    repo = current_user.repos.create(folder_params)
    return redirect_to home_index_path unless current_repo
    current_repo.repos << repo 
    redirect_to home_path(current_repo)
  end

  def destroy
    current_user.repos.destroy(params[:id])
    redirect_to home_index_path
  end
  
  private

    def folder_params
      {name: params[:name].first, type: "Folder"}
    end

end