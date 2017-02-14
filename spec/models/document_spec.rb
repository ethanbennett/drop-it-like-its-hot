require 'rails_helper'

RSpec.describe Document, type: :model do
  describe "relationships" do
    it {should_not have_many(:folders)}
    it {should_not have_many(:documents)}
  end
end
