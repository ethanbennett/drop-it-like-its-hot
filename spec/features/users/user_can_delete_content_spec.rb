require 'rails_helper'

RSpec.describe "When a user clicks on the trash icon" do
  it "they delete their file" do
    user = create(:user_with_repos_with_documents)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    repo_name = user.repos.first.name

    visit home_index_path

    expect(current_path).to eq home_index_path
    expect(page).to have_content "#{user.first_name} #{user.last_name}"
    expect(page).to have_content repo_name

    within("tr:nth-of-type(2)") do
      within("td:nth-of-type(3)") do
        click_on("delete")
      end
    end

    expect(page).to_not have_content repo_name
  end
end
