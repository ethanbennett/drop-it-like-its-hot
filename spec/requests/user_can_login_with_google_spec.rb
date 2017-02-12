require 'rails_helper'

describe OauthsController do

  before(:each) do
    get "/auth/google_oauth2/callback"
  end
  
  it "should succesfully create a session" do
    expect(session[:user_id]).to_not be_nil
  end

  it "should succesfully create a user" do
    expect(User.count).to eq 1
  end

  it "should redirect a user to the home page" do
    expect(response).to redirect_to new_phone_verification_path
  end
end