class CreateRepos < ActiveRecord::Migration[5.0]
  def change
    create_table :repos do |t|
      t.string :type
      t.references :repos, foreign_key: true
      t.string :name
      t.string :aws_url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
