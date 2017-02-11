require 'rails_helper'

RSpec.describe Repo, type: :model do
  describe "relationships" do
    it {should belong_to(:repo)}
    it {should have_many(:repos)}
  end
end
