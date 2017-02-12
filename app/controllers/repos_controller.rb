class ReposController < ApplicationController
  before_action :set_user

  def index
    @content = @user.root_content
  end

  def show
  end

private

  def set_user
    binding.pry
    @user = User.find(params[:id])
  end
end