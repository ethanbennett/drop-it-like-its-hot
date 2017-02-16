class AddPasswordColumnToRepos < ActiveRecord::Migration[5.0]
  def change
    add_column :repos, :password_digest, :string
  end
end
