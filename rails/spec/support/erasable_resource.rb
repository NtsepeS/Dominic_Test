require 'rails_helper'

RSpec.shared_examples_for "an erasable resource" do
  let(:action) {:destroy}

  before(:each) do
    @resource = create(object_key)
    delete action, id: id
  end

  context "for a valid id" do
    it "returns http status ok" do
      expect(response).to be_ok
    end

    it "the resource doesn't exist anymore" do
      get action, id: id
      expect(response).to be_not_found
    end
  end

  context "for an invalid id" do
    before(:each) do
      get action, id: "some_invalid_id"
    end

    it "returns http not found status" do
      expect(response).to be_not_found
    end
  end

end
