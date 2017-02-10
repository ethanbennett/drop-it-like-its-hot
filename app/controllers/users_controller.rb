class UsersController < ApplicationController
  # before_action :user_agreed?, only: [:create]
  extend CodeGenerator
  extend ConfirmationSender
  extend MessageSender

  def new
    @user = User.new
  end

  def create
    verification_code = CodeGenerator.generate
    byebug
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to home_index_path
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
    unless params[:user][:agrees]
      flash[:danger] = "Please agree to terms and conditions"
      render :new
    end
  end
end