require 'rails_helper'

RSpec.describe Repo, type: :model do
  describe "relationships" do
    it {should belong_to(:repo)}
    it {should have_many(:repos)}
  end

  describe "folders and documents" do
    it "behave differently as repos" do
      folder   = create(:folder)
      document = create(:document)
      folder.repos << document
      document.repos << folder

      expect(folder.repos.count).to eq(1)
      expect(document.repos.count).to eq(0)
    end
  end
end
