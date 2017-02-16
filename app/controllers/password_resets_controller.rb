class PasswordResetsController < ApplicationController

  def new
  end

  def create
    # verification_code = CodeGenerator.generate.to_s
    verification_code = "12345"
    session[:verification_code] = verification_code
    user = User.find_by(email: params[:email])
    unless user
      flash[:danger] = "Please enter a valid email"
      return redirect_to new_password_reset_path
    end
    session[:forgot_password_user_id] = user.id
    MessageSender.send_code(user.phone_number, verification_code)
    redirect_to new_phone_verification_path
  end

  def edit
    @user = User.find(session[:forgot_password_user_id])
  end


  def update
    user = User.find(session[:forgot_password_user_id])
    user.update(user_params)
    user.save
    redirect_to login_path
  end

  private

    def user_params
      params.require(:user).permit(:password)
    end
end