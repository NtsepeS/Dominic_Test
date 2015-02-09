require 'rails_helper'

RSpec.shared_examples_for "a viewable resource" do
  context "for a valid id" do
    before(:each) do
      get resource, id: id
    end

    it "returns http ok status" do
      expect(response).to be_ok
    end

    it "only contains the object key" do
      expect(json).to have_key(object_key)
    end

    it "returns one resource" do
      expect(json[object_key]).to be_a(Hash)
    end

    it "returns the correct resource" do
      expect(json[object_key][:id]).to equal(id)
    end
  end

  context "for an invalid id" do
    before(:each) do
      get resource, id: "some_invalid_id"
    end

    it "returns http not found status" do
      expect(response).to be_not_found
    end

    it "should return a error message" do
      expect(json).to have_key(:message)
    end

  end

end
