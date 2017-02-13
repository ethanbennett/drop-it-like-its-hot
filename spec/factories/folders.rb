FactoryGirl.define do
  factory :folder do
    name "Folder"

    # factory :folder_with_documents do
    #   after(:create) do |folder|
    #     binding.pry
    #     create_list(:document, 2, repo_id: folder.id, user_id: folder.user.id)
    #   end
    # end 
  end
end