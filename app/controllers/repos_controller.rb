class ReposController < ApplicationController
  before_action :set_user

  def index
    @content = @user.repos.where(repo_id: nil)
  end

  def show
    @content = @user.repos.where(repo_id: params[:id])
  end

private

  def set_user
    @user = User.find(params[:user_id])
  end
end