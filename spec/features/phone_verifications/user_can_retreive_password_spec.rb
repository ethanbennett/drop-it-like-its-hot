require 'rails_helper'

describe 'When a user visits the sign in page' do
  scenario 'they can retrieve their lost' do
    Capybara.ignore_hidden_elements
    user = create(:user)
    visit login_path

    click_on 'Forgot your password?'

    fill_in :email, :with => user.email

    expect(page).to_not have_content "Verification code"

    click_on "Send Verification Text"

    fill_in :verification_code, :with => "123"

    expect(page).to have_content

    click_on "Submit"
  end
end