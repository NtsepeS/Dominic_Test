require 'rails_helper'

RSpec.describe LoginService do
  let(:scope) { User }
  let(:auth_hash) { auth_hash_fixture }

  subject { described_class.new( scope ) }

  describe "new users" do
    it "should create the user" do
      expect {
        subject.call( auth_hash )
      }.to change {
        User.count
      }.by( 1 )
    end

    it "should set the user attributes" do
      subject.call( auth_hash )
      user = subject.user

      expect(user.name).to eq(auth_hash.info.name)
      expect(user.email).to eq(auth_hash.info.email)
      expect(user.provider).to eq(auth_hash.provider)
      expect(user.uid).to eq(auth_hash.uid)
      expect(user.ad_username).to eq(auth_hash.info.aliases[0].provider_id)
    end
  end

  describe "existing users" do
    let(:user_attributes) { attributes_for :user }
    let!(:user) { create :user, provider: auth_hash.provider, uid: auth_hash.uid }

    it "should update the users" do
      subject.call( auth_hash )
      user = subject.user

      expect(user.name).to_not eq(user_attributes[:name])
      expect(user.name).to eq(auth_hash.info.name)
    end
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
