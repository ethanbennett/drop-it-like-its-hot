require 'rails_helper'

RSpec.describe "When a user logs in" do
  before do
    create(:user_with_repos)
    visit '/login'
    fill_in :email, with: "test@test.com"
    fill_in :password, with: "password"
    click_on "Sign in"
  end

  it "they see all non-nested content" do
    expect(page).to have_link("Folder")
  end
end
