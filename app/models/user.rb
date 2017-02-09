class User < ApplicationRecord
  has_many :repos

  has_secure_password
  validates :first_name, :last_name, :email, password, :role, presence: true

  enum role: [ :user, :admin ]

  attr_accessor   :agrees

  def self.from_omniauth(auth))
    user = User.find_by_or_create(email: auth["info"]["email"])
    user.first_name = auth["info"]["name"].split(" ").first
    user.last_name  = auth["info"]["name"].split(" ").last
    user.email      = auth["info"]["email"]
    user.role       = "user"
  end
end

