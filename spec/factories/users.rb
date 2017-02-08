FactoryGirl.define do
  factory :user do
    first_name "Firstname"
    last_name "Lastname"
    email "test@test.com"
    image "link"
    password_digest "password"
    role 0
  end
  factory :admin, class: User do
    first_name "Firstname"
    last_name "Lastname"
    email "test@test.com"
    image "link"
    password_digest "password"
    role 1
  end
end
