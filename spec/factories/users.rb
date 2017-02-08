FactoryGirl.define do
  factory :user do
    first_name "Bob"
    last_name "Dylan"
    email "bob@gmail.com"
    password "1234"
    image "MyString"
    role 0
  end
end
