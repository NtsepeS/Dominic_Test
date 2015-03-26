require "rails_helper"
require "savon/mock/spec_helper"

RSpec.describe WorkflowService do

  describe "#add_user" do

    context "with new user", :vcr  do
      subject(:service) { WorkflowService.new }
      let(:user) do
        {
            user_id: 'willy',
            first_name: 'Willy',
            last_name: 'Wonka',
            email: 'willy@chocolatefactory.com',
            role: 'PROCESSMAKER_ADMIN',
            password: 'Wonka Bars'
        }
      end

      it "creates the user" do
        response = service.add_user(user)
        expect(response).to have_key(:user_uid)
        expect(response).to have_key(:message)
        expect(response[:message]).to eql("User #{user[:first_name]} #{user[:last_name]} [#{user[:user_id]}] created successfully")
      end
    end

    context "when user already exists", :vcr  do
      subject(:service) { WorkflowService.new }
      let(:user) do
        {
            user_id: 'heisenberg',
            first_name: 'Walter',
            last_name: 'White',
            email: 'heisenberg@lospolloshermanos.com',
            role: 'PROCESSMAKER_ADMIN',
            password: 'blue'
        }
      end

      it "returns an error message" do
        response = service.add_user(user)
        expect(response).to have_key(:message)
        expect(response[:message]).to eql("Username '#{user[:user_id]}' already exists")
        expect(response[:user_uid]).to be_nil
      end
    end
  end
end