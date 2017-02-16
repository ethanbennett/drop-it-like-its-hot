class DownloadsController < ApplicationController
  def show
    #.available_repos
    repo = current_user.repos.find(params[:id])
    if repo.password.nil? || password_check
      send_data Download.from_s3(repo), :filename => repo.name
    end
  end

private

  def password_check
    repo.password && repo.authenticate(params[:password])
  end
end