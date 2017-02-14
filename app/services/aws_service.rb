class AwsService
  def self.to_s3
    S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  end

  def self.from_s3(repo)
    open(URI.encode("https:#{repo.aws_url}"))
  end
end