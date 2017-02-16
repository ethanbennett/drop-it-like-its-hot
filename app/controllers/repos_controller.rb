class ReposController < ApplicationController

  def show
    session[:repo_id] = params[:id]
    redirect_to home_index_path
  end

  def create
    if aws_url
      repo = current_user.repos.create(repo_params("Document"))
    else
      repo = current_user.repos.create(repo_params("Folder"))
    end
    current_repo.repos << repo if current_repo
    redirect_to home_index_path
  end

  def destroy
    current_user.repos.delete(params[:id])
    redirect_to home_index_path
  end
  
  private


    def repo_params(type)
      {name: name, aws_url: aws_url, type: type}
    end


    def name
      params.require(:repo).require(:name).original_filename
    end

    def aws_url
      params.require(:aws_url)
    end

end