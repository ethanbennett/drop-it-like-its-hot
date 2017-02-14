class Upload

  def self.to_s3
    AwsService.set_s3_direct_post
  end

end