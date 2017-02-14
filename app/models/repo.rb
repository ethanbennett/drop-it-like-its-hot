class Repo < ApplicationRecord
  # include ActiveModel::Validations
  belongs_to :folder, optional: true
  # validates_with FolderValidator

end