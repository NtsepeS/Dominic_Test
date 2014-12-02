require 'rails_helper'

RSpec.describe Api::V1::UserInfoController do
  describe '#user' do
    context 'when the user is logged in' do
    
      let(:user) {create(:user)}
      before(:each) {sign_in(user)}

      it 'returns the users information' do
        get :user
        expect(response).to be_ok
        expect(json[:name]).to eq user.name
        expect(json[:email]).to eq user.email
        expect(json[:ad_username]).to eq user.ad_username
      end
    end
  end
end