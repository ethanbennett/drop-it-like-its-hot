require 'rails_helper'

RSpec.describe 'User can visit account details' do
  context 'Profile tab' do
  let(:user) {create(:user)}
    scenario 'Shown as default selection' do
      login user
      byebug
      # visit 
    end
  end
end