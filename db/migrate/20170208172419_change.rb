class Change < ActiveRecord::Migration[5.0]
  def change
    rename_column :repos, :repos_id, :parent_id
  end
end
