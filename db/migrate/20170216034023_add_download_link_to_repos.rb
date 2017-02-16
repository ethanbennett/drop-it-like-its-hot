class AddDownloadLinkToRepos < ActiveRecord::Migration[5.0]
  def change
    add_column :repos, :download_link, :string
  end
end
