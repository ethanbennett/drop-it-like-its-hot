require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validations" do
    it { should validate_presence_of(:first_name)}
    it { should validate_presence_of(:last_name)}
    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:role)}
    it { should define_enum_for(:role).with([:user, :admin]) }
  end

  context "relationships" do
    it {should have_many(:repos)}
  end
end
