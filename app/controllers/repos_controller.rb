class ReposController < ApplicationController

  def index
    @content = current_user.repos.where(repo_id: nil)
  end

  def show
    @content = current_user.repos.where(repo_id: params[:id])
  end

  def create
    repo = Repo.new(repo_params)
    current_user.repos << repo
    # current_repo.repos << repo
    if repo.save
      respond_to do |format|
        format.html { redirect_to home_index_path, notice: 'Repo was successfully created.' }
        format.json { render :index, status: :created, location: @user }
      end
    end
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