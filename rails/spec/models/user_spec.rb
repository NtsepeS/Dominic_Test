require 'rails_helper'

RSpec.describe User do

  describe '.from_omniauth' do
    let(:auth_hash) { auth_hash_fixture }
    subject { described_class.from_omniauth(auth_hash) }

      context 'with no existing user' do
        it 'creates the user with the correct attributes' do
          user = nil
          expect { user = subject }.to change { User.count }.from(0).to(1)
          expect(user.name).to eq(auth_hash.info.name)
          expect(user.email).to eq(auth_hash.info.email)
          expect(user.provider).to eq(auth_hash.provider)
          expect(user.uid).to eq(auth_hash.uid)
        end
      end

      context 'with an existing user' do
        let(:user_attributes) { attributes_for :user }
        let!(:user) { create :user, provider: auth_hash.provider, uid: auth_hash.uid }

        it 'updates the user with the correct attributes' do
          user = subject
          expect(user.name).to_not eq(user_attributes[:name])
          expect(user.name).to eq(auth_hash.info.name)
        end
      end
  end
end