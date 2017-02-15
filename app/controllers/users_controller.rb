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
    if @user.save
      session[:user_id] = @user.id
      redirect_to home_index_path
    else
      flash[:danger] = @user.errors.full_messages.first
      render :new
    end
  end

  def update
    user = current_user
    user.update(update_params)
    user.save
    redirect_to account_index_path
  end

  private

  def user_params
    params[:user][:role] = "user"
    params.require(:user).permit(:first_name, :last_name, :email, :password, :role)
  end

  def update_params
    params.permit(:first_name, :last_name, :email, :password,)
  end

  def user_agreed?
    unless params[:user][:checkbox]
      flash[:danger] = "Please agree to terms and conditions"
      @user = User.new(user_params)
      render :new
    end
  end

end