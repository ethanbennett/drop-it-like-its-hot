class User < ApplicationRecord
  has_many :repos

  has_secure_password
  validates :first_name, :last_name, :email, :role, presence: true

  enum role: [ :user, :admin ]

  attr_accessor   :agrees

end

