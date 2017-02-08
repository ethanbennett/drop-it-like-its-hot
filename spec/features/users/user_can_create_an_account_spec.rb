require 'rails_helper'

describe "When a user visits the landing page" do
  scenario "they can create an account" do
    visit root_path

    click_on "Create Account"

    fill_in :first_name, :with => "Bob"
    fill_in :last_name, :with => "Dylan"
    fill_in :email, :with => "bob@gmail.com"
    fill_in :password, :with => "1234"
    check "agree-checkbox"

    click_on "Create an account"

    expect(current_path).to eq home_path
    within ".nav-wrapper" do
      expect(page).to have_link "Bob Dylan"
    end
    expect(page).to have_content "Files"
    expect(page).to have_content "Photos"
    expect(User.count).to eq 1
  end
end