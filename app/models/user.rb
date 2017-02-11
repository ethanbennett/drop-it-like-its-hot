class User < ApplicationRecord
  has_many :repos

  has_secure_password
  validates_acceptance_of :terms
  validates :first_name, :last_name, :email, :role, presence: true

  enum role: [ :user, :admin ]

  attr_accessor :checkbox

  def self.from_omniauth(auth)
    user = User.find_or_create_by(email: auth["info"]["email"])
    user.first_name = auth["info"]["name"].split(" ").first
    user.last_name  = auth["info"]["name"].split(" ").last
    user.email      = auth["info"]["email"]
    user.password   = rand(1000000...10000000).to_s
    user.role       = "user"
    user.save
    user
  end

end

