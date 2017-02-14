class HomeController < ApplicationController
  before_action :set_s3_direct_post, only: [:index]

  def index
    @user_dashboard = UserDashboard.new(user: current_user)
    @repo = Repo.new
    @repos = Repo.where(repo_id: current_repo)
  end


  private

    def set_s3_direct_post
      @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
    end
end