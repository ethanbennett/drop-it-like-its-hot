require 'rails_helper'

RSpec.describe 'User can visit account details' do
  context 'Profile tab' do
  let(:user) {create(:user)}
    scenario 'Shown as default selection' do
      login user

      visit account_index_path

      expect(page).to have_content("Profile")
      expect(page).to have_content("Security")
      expect(page).to have_content("Account")

      within("#profile") do
        expect(page).to have_content(user.first_name)
        expect(page).to have_content(user.last_name)
      end
    end
  end
end