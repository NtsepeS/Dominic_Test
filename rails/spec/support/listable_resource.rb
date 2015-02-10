require 'rails_helper'

RSpec.shared_examples_for "a listable resource" do
  let(:action) {:index}
  let(:object_key) { super().to_s.pluralize.to_sym }

  before(:each) do
    get action
  end

  it "returns http ok status" do
    expect(response).to be_ok
  end

  it "contains the object key" do
    expect(json).to have_key(object_key)
  end

  it "has object entries" do
    expect(json[object_key]).to_not be_empty
  end
end
