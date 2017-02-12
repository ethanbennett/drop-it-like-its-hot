require 'rails_helper'

RSpec.describe Repo, type: :model do
  describe "relationships" do
    it {should belong_to(:repo)}
    it {should have_many(:repos)}
  end

  before do
    user     = create(:user)
    folder   = create(:folder)
    document = create(:document)
  end
end
