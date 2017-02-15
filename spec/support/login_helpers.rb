module LoginHelpers
  def login(account)
    visit root_path

    click_on "Sign in"

    fill_in :email, with: account.email
    fill_in :password, with: "password"

    click_on "Sign in"
  end

  def account_profile(account)
    login account

    visit account_index_path

    within("#all-tabs") do
      click_on "Profile"
    end
  end
end