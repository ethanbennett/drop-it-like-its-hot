class User < ApplicationRecord
  has_many :repos

  has_secure_password
  validates :first_name, :last_name, :email, :role, presence: true

  enum role: [ :user, :admin ]

  attr_accessor   :agrees

  def self.root_content
    repos.where(repo_id: nil)
  end
end

