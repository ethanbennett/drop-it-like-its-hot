require 'rails_helper'

RSpec.describe Folder, type: :model do
  describe "relationships" do
    it {should have_many(:repos)}
    # it {should have_many(:documents)}
  end
end
