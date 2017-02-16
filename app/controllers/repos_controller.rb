class ReposController < ApplicationController

  def show
    session[:repo_id] = params[:id]
    repo = current_user.repos.find(params[:id])
    redirect_to home_path(repo)
  end

  def create
    if params[:aws_url]
      repo = current_user.repos.create(document_params)
    else
      repo = current_user.repos.create(folder_params)
    end
    if current_repo
      current_repo.repos << repo 
      return redirect_to home_path(current_repo)
    end
    redirect_to home_index_path
  end

  def destroy
    current_user.repos.destroy(params[:id])
    redirect_to home_index_path
  end
  
  private


    def document_params
      {name: params[:repo][:name].original_filename, aws_url: params[:aws_url], type: "Document", password: params[:password]}
    end

    def folder_params
      {name: params[:name].first, type: "Folder"}
    end

    # def repo_params(type)
    #   {name: name, aws_url: aws_url, type: type, password: password}
    # end

    # def name
    #   params.require(:repo).require(:name).original_filename
    # end

    # def aws_url
    #   params.permit(:aws_url)
    # end
end

