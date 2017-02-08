class Repo < ApplicationRecord
  belongs_to :repo, optional: true
  has_many :repos
end
