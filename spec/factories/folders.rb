FactoryGirl.define do
  factory :folder do
    name "Folder"

    factory :folder_with_documents do
      after(:create) do |folder|
        create_list(:document, 2, repo: folder)
      end
    end 

  end
end