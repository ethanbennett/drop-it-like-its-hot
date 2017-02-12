FactoryGirl.define do
  factory :user do
    first_name "Firstname"
    last_name "Lastname"
    email "test@test.com"
    image "link"
    password "password"
    role 0

    factory :user_with_repos do
      after(:create) do |user|
        create(:folder_with_documents, user: user)
      end
    end
  end
  
  factory :admin, class: User do
    first_name "Firstname"
    last_name "Lastname"
    email "test@test.com"
    image "link"
    password "password"
    role 1
  end

  # factory :user_with_repos, class: User do
  #   user
  #   user.repos << create(:folder)
  #   user.repos << create(:document)
  # end
end
