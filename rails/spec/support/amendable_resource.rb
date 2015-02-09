require 'rails_helper'

RSpec.shared_examples_for "an amendable resource" do

  context "for a valid id" do
    context "for valid attributes" do
      before(:each) do
        post resource, id: id, object_key => {amendable_key => amendable_value}
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
        expect(json[object_key][amendable_key]).to eql(amendable_value)
      end
    end

    context "for invalid attributes" do
      before(:each) do
        random_key = (0...8).map { (65 + rand(26)).chr }.join
        post resource, id: id, object_key => {random_key.to_sym => amendable_value}
      end

      it "returns http bad request status" do
        expect(response).to be_bad_request
      end

      it "should return a error message" do
        expect(json).to have_key(:message)
      end
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
