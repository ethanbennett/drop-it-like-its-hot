class HomeController < ApplicationController
  before_action :set_s3_direct_post, only: [:index]

  def new
  end

  def index
    @repo = Repo.new
  end

  private

    def set_s3_direct_post
      @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
    end
end