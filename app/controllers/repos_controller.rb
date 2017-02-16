class ReposController < ApplicationController

  def show
    session[:repo_id] = params[:id]
    redirect_to home_index_path
  end

  def create
    if aws_url
      repo = current_user.repos.create(document_params)
    else
      repo = current_user.repos.create()
    end
    current_repo.repos << repo if current_repo
    redirect_to home_index_path
  end

  def destroy
    current_user.repos.delete(params[:id])
    redirect_to home_index_path
  end
  
  private


    def document_params
      {name: name, aws_url: aws_url, type: "Document"}
    end

    def folder_parems
      params.require(:repo).permit()
    end


    def name
      params.require(:repo).require(:name).original_filename
    end

    def aws_url
      params.require(:aws_url)
    end

end