class Repo < ApplicationRecord
  belongs_to :repos
  belongs_to :user
end
