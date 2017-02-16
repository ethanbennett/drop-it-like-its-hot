class DownloadsController < ApplicationController

  def index
    @repo = Repo.find_by(code: params[:code])
  end

  def show
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