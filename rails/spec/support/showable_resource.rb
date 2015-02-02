require 'rails_helper'
require 'pry'

RSpec.shared_examples_for "a showable resource" do


  context "for a valid id" do
    before(:each) do
      # binding.pry
      get resource, id: id
    end

    it "returns http ok status" do
      expect(response).to be_ok
    end

    it "only contains the object key" do
      expect(json).to have_key(:geometry)
    end

    it "returns one resource" do
      expect(json[:geometry]).to be_a(Hash)
    end

    it "returns the correct resource" do
      expect(json[:geometry][:id]).to equal(id)
    end
  end

  context "for an invalid id" do
    before(:each) do
      # binding.pry
      get resource, id: "some_invalid_id"
    end

    it "returns http not found status" do
      # binding.pry
      expect(response).to be_not_found
    end

  end

end
