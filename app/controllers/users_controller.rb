class UsersController < ApplicationController
  # before_action :user_agreed?, only: [:create]
  # before_action :set_user, only: [:show, :edit, :update, :destroy]
  # before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]
  before_action :user_agreed?, only: [:create]
  extend CodeGenerator
  extend ConfirmationSender
  extend MessageSender

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to new_phone_verification_path
    else
      flash[:danger] = @user.errors.full_messages.first
      render :new
    end
  end

  private

  def user_params
    params[:user][:role] = "user"
    params.require(:user).permit(:first_name, :last_name, :email, :password, :role)
  end

  def user_agreed?
    unless params[:user][:checkbox]
      flash[:danger] = "Please agree to terms and conditions"
      @user = User.new(user_params)
      render :new
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  # def set_user
  #   @user = User.find(params[:id])
  # end

  # def set_s3_direct_post
  #   @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  # end

end