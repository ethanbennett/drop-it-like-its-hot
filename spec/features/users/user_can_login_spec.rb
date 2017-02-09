require 'rails_helper'

describe "When a user click on sign in" do
  scenario "they can login" do
    user = create(:user)
    
    visit root_path

    click_on "Sign in"

    fill_in :email, :with => user.email
    fill_in :password, :with => user.password

    click_on "Sign in"

    expect(current_path).to eq home_index_path
    within ".nav-wrapper" do
      expect(page).to have_link "Bob Dylan"
    end
    expect(page).to have_content "Files"
    expect(page).to have_content "Photos"

  end
end