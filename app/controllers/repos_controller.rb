class ReposController < ApplicationController

  def show
    session[:repo_id] = params[:id]
    repo = current_user.repos.find(params[:id])
    redirect_to home_path(repo)
  end

  def create
    repo = current_user.repos.create(repo_params)
    redirect_to home_index_path unless current_repo
    current_repo.repos << repo 
    return redirect_to home_path(current_repo)
  end

  def destroy
    current_user.repos.destroy(params[:id])
    redirect_to home_index_path
  end
  
  private

    def repo_params
      {name: name, aws_url: aws_url, type: type, password: password, type: "Document"}
    end

    def name
      params.require(:repo).require(:name).original_filename
    end

    def aws_url
      params.permit(:aws_url)
    end
end

