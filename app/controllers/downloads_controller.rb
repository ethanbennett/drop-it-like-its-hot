class DownloadsController < ApplicationController
  def index
    @repo = Repo.find_by(code: params[:code])
  end

  def show
  end
end