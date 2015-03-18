require 'rails_helper'

RSpec.describe Api::V1::AuthorizationsController do
  let(:user) { create(:user) }

  before(:each) do
    sign_in user
  end

  describe "#create" do
    it "should call the invite service" do
      authz = Authorization.new
      invite = double("InviteService", :successful? => true, :authorization => authz)
      expect(invite).to receive(:call).with(
        "user", "email@mailinator.com", "jim", user.name, request
      )
      expect(InviteService).to receive(:new).and_return(invite)

      post :create, authorization: { email: "email@mailinator.com", name: "jim" }

      expect( response ).to be_success
    end
  end
end
