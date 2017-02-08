module LoginHelpers
  def login(account)
    visit root_path

    click_on "Sign in"

    fill_in :user[email], with: account.email
    fill_in :user[password], with: "password"

    click_on "Sign in"
  end
end