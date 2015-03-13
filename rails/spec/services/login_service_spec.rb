require 'rails_helper'

RSpec.describe LoginService do
  let(:scope) { User }
  subject { described_class.new( scope ) }

  describe "new users" do
    it "should create the user"
  end

  describe "existing users" do
    it "should update the users"
  end

  describe "omniauth failures" do
    it "should bail out" do
      auth = OmniAuth::AuthHash.new({
        error_uri: nil, error_description: nil, error: "invalid_grant"
      })

      subject.call( auth )

      expect( subject.successful? ).to be(false)
    end
  end
end
