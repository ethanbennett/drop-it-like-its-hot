require 'rails_helper'

describe "ReposController" do
  it "can create a repo" do
    upload = Rack::Test::UploadedFile.new("./spec/fixtures/me.txt")
    user = create(:user_with_repos_with_documents)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    post "/repos", params: {aws_url: "test_url", repo: {name: upload} }

    expect(response.redirect?).to be true 
    expect(response). to redirect_to home_index_path
  end

  it "can set repo sesison id" do
    user = create(:user_with_repos_with_documents)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    repo = create(:document)
    get "/repos/#{repo.id}"

    expect(response.redirect?).to be true
    # expect(response). to redirect_to root_path
    expect(session[:repo_id]).to_not be_nil
  end
end