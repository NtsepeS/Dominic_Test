require 'rails_helper'
require 'pry'

RSpec.shared_examples_for "a listable resource" do
  before(:each) do
    get resource
  end

  it "returns http ok status" do
    # binding.pry
    expect(response).to be_ok
  end

  it "contains the object key" do
    expect(json).to have_key(object_key)
  end

  it "has object entries" do
    expect(json[object_key]).to_not be_empty
  end
end
