class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:repo_id] = user.repos.find_by(repo_id: nil).id
      redirect_to home_index_path
    else
      flash[:danger] = "Invalid email/password combination"
      render :new
    end
  end
end