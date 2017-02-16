class Repo < ApplicationRecord
  include ActiveModel::Validations
  belongs_to :user
  belongs_to :folder, foreign_key: :repo_id, optional: true
  validates_with FolderValidator

  def self.generate_download_link
    code = CodeGenerator.generate
    Repo.update(download_link: "http://box-drop.herokuapp.com/download?code=#{code}")
  end

end