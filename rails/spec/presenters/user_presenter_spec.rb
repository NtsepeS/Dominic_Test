require 'rails_helper'

RSpec.describe UserPresenter do
  let(:user) {build(:user)}
  let(:presenter) { UserPresenter.new(user)}

  describe '#as_json' do
    subject { presenter.as_json }
    it 'returns a hash of user details' do
      user_info = subject
      expect(user_info).to eq({
        name: user.name,
        email: user.email,
      })
    end
  end
end

