require 'rails_helper'

describe "When a user visits the landing page" do
  xscenario "they can create an account" do
    visit root_path

    click_on "Create Account"

    fill_in :user_first_name, :with => "Bob"
    fill_in :user_last_name, :with => "Dylan"
    fill_in :user_email, :with => "bob@gmail.com"
    fill_in :user_password, :with => "1234"
    check :user_agrees
    click_on "Create an account"

    expect(current_path).to eq home_index_path
    within ".nav-wrapper" do
      expect(page).to have_link "Bob Dylan"
    end
    expect(page).to have_content "Files"
    expect(page).to have_content "Photos"
    expect(User.count).to eq 1
  end
end