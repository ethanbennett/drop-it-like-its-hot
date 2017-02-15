require 'rails_helper'

RSpec.describe 'User can update name details' do
  let(:user) {create(:user)}
  scenario 'Through model Change Name link from Profile tab' do
    new_first_name = "NewFirst"
    new_last_name = "NewLast"
    account_profile user

    within(".account-name") do
      click_on "Change name"
    end

    within("#change-username") do
      # within(".input-field:nth-of-type(1)") do
      #   expect(page).to have_content(user.first_name)
      # end

      fill_in "first_name", with: new_first_name
      fill_in "last_name", with: new_last_name

      click_on "Change name"
    end

    expect(current_path).to eq(account_index_path)

    within(".nav-wrapper") do
      expect(page).to have_content(new_first_name)
      expect(page).to have_content(new_last_name)
    end
  end
end