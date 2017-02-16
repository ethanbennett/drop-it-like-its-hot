class Repo < ApplicationRecord
  include ActiveModel::Validations
  has_secure_password :validations => false
  belongs_to :user
  belongs_to :folder, foreign_key: :repo_id, optional: true
  validates_with FolderValidator

  def generate_download_link
    code = CodeGenerator.generate
    self.update(download_link: "http://box-drop.herokuapp.com/download?code=#{code}", code: code)
  end

end