require 'rails_helper'

RSpec.describe 'Code Generator' do
  it 'Can generate random number and return as String' do
    first_test_code = CodeGenerator::generate
    second_test_code = CodeGenerator::generate

    expect(first_test_code).to be_a(String)
    expect(second_test_code).to be_a(String)
    expect(first_test_code).not_to eq(second_test_code)
  end
end