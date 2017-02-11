class OauthsController < ApplicationController

  def create
    user = User.from_omniauth(auth)
    session[:user_id] = user.id
    redirect_to new_phone_verification_path
  end

  private

    def auth
      request.env['omniauth.auth']
    end
end