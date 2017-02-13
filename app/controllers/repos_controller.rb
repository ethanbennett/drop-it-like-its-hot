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


  def get_repo
    repo = Repo.find(params[:id])
    #we need to sanitize the aws url to work with special characters
    # url = URI.parse(URI.encode("https:#{repo.aws_url}"))
    # url = "https:#{repo.aws_url}"
    # url = Addressable::URI.parse("https:#{repo.aws_url}")
    # url = url.normalize
    data = open("https:#{repo.aws_url}")
    send_data data.read, :filename => "test.jpg"
  end
  
  
  private

    def repo_params
      params.require(:repo).permit(:aws_url)
    end

end