class PasswordResetsController < ApplicationController

  def new
  end

  def create
    #for production
    # verification_code = CodeGenerator.generate.to_s
    verification_code = "123"
    session[:verification_code] = verification_code
    user = User.find_by(email: params[:email])
    session[:forgot_password_user_id] = user.id
    # MessageSender.send_code(user.phone_numbwer, verification_code)
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