require 'rails_helper'

RSpec.describe "When a user logs in" do
  before do
    user = create(:user_with_repos)
    visit '/login'
    fill_in :email, with: "test@test.com"
    fill_in :password, with: "password"
    click_on "Sign in"
    save_and_open_page
    click_on "Folder"
  end

  it "they see all nested content" do
    expect(page).to have_content("Document")
  end
end