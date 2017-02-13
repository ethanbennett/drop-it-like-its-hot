class DownloadsController < ApplicationController
  def show
    #.available_repos
    repo = current_user.repos.find(params[:id])
    data = open(URI.encode("https:#{repo.aws_url}"))
    send_data data.read, :filename => "test.jpg"
  end
end