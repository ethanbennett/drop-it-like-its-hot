class Repo < ApplicationRecord
  include ActiveModel::Validations
  has_secure_password :validations => false
  belongs_to :user
  belongs_to :folder, foreign_key: :repo_id, optional: true
  validates_with FolderValidator

end