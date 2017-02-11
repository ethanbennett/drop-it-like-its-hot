class Repo < ApplicationRecord
  include ActiveModel::Validations
  
  belongs_to :repo, optional: true
  has_many :repos
  validates_with FolderValidator
end
