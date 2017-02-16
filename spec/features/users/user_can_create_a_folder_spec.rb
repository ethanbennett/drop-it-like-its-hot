require 'rails_helper'

RSpec.describe "When a user clicks on the new folder icon" do
  it "they can create a folder" do
    user = create(:user_with_repos_with_documents)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit home_index_path

    click_on "create_new_folder"

    fill_in "name[]", :with => "WHAT"

    click_on "Create folder"

    expect(page).to have_content "WHAT"
  end
end
