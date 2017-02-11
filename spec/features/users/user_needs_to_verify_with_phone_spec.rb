require 'rails_helper'

describe "When a use tries to login" do
  scenario "they need to input an sms verification code" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_phone_verification_path

    expect(page).to have_content "What's your phone number?"
    fill_in :phone_number, :with => "7205564307"

    click_on "Submit"

    expect(page). to have_content "Please enter your verification code below."

    fill_in :verification_code, :with => "123"

    click_on "Submit"

    expect(current_path).to eq home_index_path
    within ".nav-wrapper" do
      expect(page).to have_link "Bob Dylan"
    end
    expect(page).to have_content "Files"
    expect(page).to have_content "Photos"
  end
end