class UsersController < ApplicationController
  before_action :user_agreed?, only: [:create]
  
  extend CodeGenerator
  extend ConfirmationSender
  extend MessageSender

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    repo = Repo.create(type: 'file')
    if @user.save
      session[:user_id] = @user.id
      session[:repo_id] = repo.id
      user.repos << repo
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

end