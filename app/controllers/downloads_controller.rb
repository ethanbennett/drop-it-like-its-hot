class DownloadsController < ApplicationController
  def show
    #possibly add in current_user
    #.available_repos
    repo = Repo.find(params[:id])
    data = open(URI.encode("https:#{repo.aws_url}"))
    send_data data.read, :filename => "test.jpg"
  end
end