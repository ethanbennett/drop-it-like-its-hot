class ReposController < ApplicationController

  def show
    session[:repo_id] = params[:id]
    redirect_to home_path
  end

  def create
    if aws_url
      repo = current_user.repos.create(aws_url: aws_url, name: name, type: "Document")
    else
      repo = current_user.repos.create(name: params[:name], type: "Folder")
    end
    current_repo.repos << repo if current_repo
    redirect_to home_index_path
  end
  
  private

    def name
      params[:repo][:name].original_filename
    end

    def aws_url
      params[:aws_url]
    end

end