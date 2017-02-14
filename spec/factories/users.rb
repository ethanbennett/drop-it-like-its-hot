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
        create(:folder, user_id: user.id)
      end

      factory :user_with_repos_with_documents do
        after(:create) do |user_with_repos|
          create_list(:document, 2, repo_id: user_with_repos.repos.first.id, user_id: user_with_repos.id)
        end
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
end