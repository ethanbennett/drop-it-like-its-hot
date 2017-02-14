require 'rails_helper'

RSpec.describe Repo, type: :model do
  describe "relationships" do
    it {should belong_to(:folder)}
    it {should belong_to(:user)}
  end
end
