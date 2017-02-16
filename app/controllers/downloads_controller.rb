class DownloadsController < ApplicationController
  def show
    #.available_repos
    repo = current_user.repos.find(params[:id])
    if repo.password.nil? || password_check
      #instead of test.jpg we will use repo.name
      send_data Download.from_s3(repo), :filename => "test.jpg"
    end
  end

private

  def password_check
    repo.password && repo.authenticate(params[:password])
  end
end