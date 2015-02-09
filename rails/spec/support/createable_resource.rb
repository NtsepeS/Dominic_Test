require 'rails_helper'

RSpec.shared_examples_for "a createable resource" do
  let(:action) {:create}

  context "for valid attributes" do

    before(:each) do
      post action, object_key => hash
    end

    it "returns http ok status" do
      expect(response).to be_created
    end

    it "returns the created resource" do
      expect(json[object_key]).to_not be_empty
      expect(json[object_key]).to be_a(Hash)
      expect(json[object_key]).to have_key(:id)
    end

  end

  context "for invalid attributes" do
    before(:each) do
      random_key = (0...8).map { (65 + rand(26)).chr }.join
      random_value = (0...8).map { (65 + rand(26)).chr }.join

      post action, object_key => {random_key.to_sym => random_value}
    end

    it "returns http bad request status" do
      expect(response).to be_bad_request
    end

    it "should return a error message" do
      expect(json).to have_key(:message)
    end
  end
end
