FactoryGirl.define do
  factory :user do
    first_name "Firstname"
    last_name "Lastname"
    email "test@test.com"
    image "link"
    password_digest "MyString"
    role 0
  end
    factory :user_admin, class: User do
    first_name "Firstname"
    last_name "Lastname"
    email "test@test.com"
    image "link"
    password_digest "MyString"
    role 1
    end
end
