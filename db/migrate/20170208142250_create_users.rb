class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string    :first_name
      t.string    :last_name
      t.string    :email
      t.string    :password_digest
      t.integer   :role
      t.datetime  :create_at,     null: false
      t.datetime  :updated_at,  null: false
    end
  end
end
