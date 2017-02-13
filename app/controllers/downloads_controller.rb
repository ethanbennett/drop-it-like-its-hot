class DownloadsController < ApplicationController
  def show
    repo = Repo.find(params[:id])
    data = open("https:#{repo.aws_url}")
    send_data data.read, :filename => "test.jpg"
  end
end