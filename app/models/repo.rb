class Repo < ApplicationRecord
  include ActiveModel::Validations
  
  belongs_to :repo, optional: true
  has_many :repos
  validates_with FolderValidator

  def self.set_s3_direct_post
    S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  end

  def self.get_repo
    repo = Repo.find(params[:id])
    #we need to sanitize the aws url to work with special characters
    data = open("https:#{repo.aws_url}")
    send_data data.read, :filename => "test.jpg"
  end
end
