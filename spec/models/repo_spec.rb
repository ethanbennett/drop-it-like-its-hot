require 'rails_helper'

RSpec.describe Repo, type: :model do
  describe "relationships" do
    it {should belong_to(:folder)}
    it {should belong_to(:user)}
  end

  xdescribe "folders and documents" do
    it "behave differently as repos" do
      folder   = create(:folder)
      document = create(:document)
      folder.repos << document

      expect(document.repos << folder).to raise_error(NameError)
      expect(folder.repos.count).to eq(1)
      expect(document.repos.count).to eq(0)
    end
  end
end
