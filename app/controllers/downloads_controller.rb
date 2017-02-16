class DownloadsController < ApplicationController
  def show
    #.available_repos
    repo = current_user.repos.find(params[:id])
    send_data Download.from_s3(repo), :filename => repo.name
  end
end