class AddCodeToRepos < ActiveRecord::Migration[5.0]
  def change
    add_column :repos, :code, :string
  end
end
