require 'rails_helper'

RSpec.describe "When a user visits the home index path" do
  it "they see all nested content" do
    user = create(:user_with_repos_with_documents)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit home_index_path

    expect(current_path).to eq home_index_path
    expect(page).to have_content "#{user.first_name} #{user.last_name}"
    #add tests
  end
end