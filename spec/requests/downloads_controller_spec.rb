require 'rails_helper'

describe "DownloadsController" do
  it "can download a repo" do
    VCR.use_cassette("download_from_aws") do
      user = create(:user_with_repos)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      repo = create(:document, aws_url: ENV["AWS_TESTING_URL"])
      user.repos << repo

      s3 = Aws::S3::Client.new(stub_responses: true)
      get "/downloads/#{repo.id}"
    end
  end
end