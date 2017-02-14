class PhoneVerificationsController < ApplicationController
  def new
  end

  def create
    if session[:verification_code] == params[:verification_code]
      redirect_to edit_password_reset_path
    else
      flash[:danger] = "You enterered an incorrect verification code"
      render :new
    end
  end
end