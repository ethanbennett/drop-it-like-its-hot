class OauthsController < ApplicationController

  def create
    user = User.from_omniauth(auth)
    repo = user.repos.find_or_create_by(repo_id: nil)
    repo.type = 'Folder'
    repo.save
    session[:user_id] = user.id
    session[:repo_id] = repo.id
    redirect_to home_index_path
  end

  private

    def auth
      request.env['omniauth.auth']
    end
end