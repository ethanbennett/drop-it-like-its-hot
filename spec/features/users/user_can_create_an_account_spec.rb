require 'rails_helper'

describe "When a user visits the landing page" do
  scenario "they can create an account" do
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

  scenario "they need to reenter their information" do
    visit root_path

    click_on "Create Account"

    fill_in :user_first_name, :with => "Bob"
    fill_in :user_last_name, :with => "Dylan"
    fill_in :user_email, :with => "bob@gmail.com"
    check :user_agrees
    click_on "Create an account"

    expect(current_path).to eq users_path
    expect(page).to have_content "Password can't be blank"
  end

  scenario "they need to check the agree box" do
    visit root_path

    click_on "Create Account"

    fill_in :user_first_name, :with => "Bob"
    fill_in :user_last_name, :with => "Dylan"
    fill_in :user_email, :with => "bob@gmail.com"
    fill_in :user_password, :with => "1234"

    click_on "Create an account"

    expect(current_path).to eq users_path
    expect(page).to have_content "Password can't be blank"
  end
end