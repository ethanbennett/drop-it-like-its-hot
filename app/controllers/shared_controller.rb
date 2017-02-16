class SharedController < ApplicationController
  def show
    @repo = Repo.find(params[:id])
    if repo.password.nil? || password_check
      send_data Download.from_s3(@repo), :filename => @repo.name
    end
  end

  def password_check
    @repo.authenticate(params[:password])
  end
end