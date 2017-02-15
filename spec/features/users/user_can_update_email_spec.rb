require 'rails_helper'

RSpec.describe 'User can update email' do
  let(:user) {create(:user)}
  let(:updated_user) {User.find(user.id)}
  let(:new_email) {"New@new.com"}

  scenario 'When typed matching emails' do
    account_profile user
    old_email = user.email

    within(".account-email") do
      click_on "Change email"
    end

    within("#change-email") do
      fill_in "email", with: new_email
      fill_in "email_confirm", with: new_email

      click_on "Update email"
    end

    expect(current_path).to eq(account_index_path)

    within(".account-email") do
      expect(page).to have_content(new_email)
      expect(updated_user.email).to eq(new_email)
      expect(page).not_to have_content(old_email)
    end
  end
end