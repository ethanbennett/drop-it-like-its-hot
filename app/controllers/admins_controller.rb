class AdminsController < ApplicationController

  def show
    session[:admin_id] = current_user
    session[:user_id] = params[:id]
    redirect_to home_index_path
  end

end