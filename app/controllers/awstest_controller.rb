class AwstestController < ApplicationController
  before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]

  def index





  end

  private

  def set_s3_direct_post
    @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  end
end
    # Aws.config.update({
    #   region: 'us-west-2',
    #   credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])
    # })
    # s3 = Aws::S3::Client.new
    # resp_buckets = s3.list_buckets
    # resp_buckets.buckets.map(&:name)

    # resp = s3.list_objects(bucket: 'dropbuckettest')
    # resp.contents.each do |object|
    #   puts "#{object.key} => #{object.etag}"
    # end

    # s3_upload = Aws::S3::Resource.new(region:'us-west-2')
    # key = "amazon-web-services.jpg"
    # obj = s3_upload.bucket('dropbuckettest').object(key)
    # upload_result = obj.upload_file('/Users/Laszlo/Downloads/amazon-web-services.jpg')

    # byebug