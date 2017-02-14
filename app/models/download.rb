class Download
  def self.from_s3(repo)
    AwsService.from_s3(repo).read
  end
end