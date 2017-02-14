require 'rails_helper'

describe "When a user clicks on sign in" do
  scenario "they can login" do
    user = create(:user)
    
    visit root_path

    click_on "Sign in"

    fill_in :email, :with => user.email
    fill_in :password, :with => user.password

    click_on "Sign in"

    expect(current_path).to eq home_index_path
  end

  scenario "they need to reenter their information" do
    user = create(:user)
    
    visit root_path

    click_on "Sign in"

    fill_in :email, :with => user.email
    fill_in :password, :with => "1111"

    click_on "Sign in"

    expect(current_path).to eq login_path
    expect(page).to have_content "Invalid email/password combination"
  end
end