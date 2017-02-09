require 'rails_helper'

RSpec.describe 'User can visit account details' do
  let(:user) {create(:user)}
  context 'Profile tab' do
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
      login user

      visit account_index_path

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
  end #End of context Profile tab

  context 'Account tab' do
    it 'Shows Account Space details' do
      login user

      visit account_index_path

      within("#account") do
        expect(page).to have_content("Space")
        expect(page.find(".progress")).to be_truthy
      end
    end
  end #End of context Account tab

  context 'Privacy tab' do
    it 'Shows Account Security details' do
      login user

      visit account_index_path

      within("#security") do
        within(".account-password") do
          expect(page).to have_content("Password")
          expect(page).to have_link("Change password")
          expect(page).to have_link("Forgot password?")
        end
        within(".account-verification") do
          expect(page).to have_content("Two-step verification")
          expect(page).to have_content("Status")
          expect(page).to have_link("click to enable")
        end
      end
    end
  end #End of context Privacy tab
end