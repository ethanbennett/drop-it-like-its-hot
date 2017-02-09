class SessionsController < ApplicationController
  def new
    @user = User.from_omniauth(env["omniauth.auth"])
    if user.email && user.password
      redirect_to action: "create", 
    else
    else
      render :new

  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to home_index_path
    else
      flash[:danger] = "Invalid email/password combination"
      render :new
    end
  end
end