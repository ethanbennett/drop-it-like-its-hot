class AddStatusToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column  :users, :status, :integer
    change_column_default(:users, :status, 0)
  end
end
