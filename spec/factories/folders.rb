FactoryGirl.define do
  factory :folder do
    sequence :name do |n|
      "example#{n}"
    end
    user
  end
end
