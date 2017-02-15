require 'rails_helper'

RSpec.describe 'User can logout' do
  let(:user) { create(:user) }
  scenario 'After successful login' do
    login user

    within("#navbar-user-dropdown") do
      click_on "Logout"
    end

    expect(current_path).to eq(login_path)
  end
end