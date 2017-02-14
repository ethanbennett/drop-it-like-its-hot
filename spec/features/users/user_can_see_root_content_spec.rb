require 'rails_helper'

RSpec.describe "A user sees all non-nested content" do
  it "once they've logged in" do
    user = create(:user_with_repos)
    visit '/login'
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_on "Sign in"

    expect(current_path).to eq home_index_path
    expect(page).to have_content "#{user.first_name} #{user.last_name}"
    #add tests
  end
end
