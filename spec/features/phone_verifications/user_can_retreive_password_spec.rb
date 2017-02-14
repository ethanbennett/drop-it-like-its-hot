require 'rails_helper'

describe 'When a user visits the sign in page' do
  scenario 'they can retrieve their lost' do
    Capybara.ignore_hidden_elements
    user = create(:user)
    visit login_path

    click_on 'Forgot your password?'

    expect(page).to have_content "What's your email?"

    fill_in :email, :with => user.email

    expect(page).to_not have_content "Verification code"

    click_on "Send Verification Text"

    fill_in :verification_code, :with => "123"

    click_on "Submit"

    expect(page).to have_content "Please enter a new password"

    fill_in "user[password]", :with => "1234"

    click_on "Change password"

    expect(current_path).to eq login_path
  end
end