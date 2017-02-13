class OauthsController < ApplicationController

  def create
    user = User.from_omniauth(auth)
    session[:user_id] = user.id
    redirect_to home_index_path
  end

  private

    def auth
      request.env['omniauth.auth']
    end
end