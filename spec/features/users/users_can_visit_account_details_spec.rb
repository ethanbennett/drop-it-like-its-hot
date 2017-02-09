require 'rails_helper'

RSpec.describe 'User can visit account details' do
  context 'Profile tab' do
  let(:user) {create(:user)}
    scenario 'Tab selected by default' do
      login user

      visit account_index_path

      within("#all-tabs") do
        expect(page.find("#tab-profile-link")[:class]).to eq("active")
        expect(page.find("#tab-account-link")[:class]).not_to eq("active")
        expect(page.find("#tab-security-link")[:class]).not_to eq("active")
      end
    end
    scenario 'Shows Account Profile details' do

      expect(page).to have_content("Profile")
      expect(page).to have_content("Security")
      expect(page).to have_content("Account")

      within("#profile") do
        within(".account-name") do
          expect(page).to have_content(user.first_name)
          expect(page).to have_content(user.last_name)
          expect(page).to have_link("Change")
        end
        within(".account-photo") do
          expect(page).to have_link("Add photo")
        end
        expect(page).to have_content(user.email)
      end
    end
  end
end