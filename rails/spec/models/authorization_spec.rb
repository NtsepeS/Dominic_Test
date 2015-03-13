require 'rails_helper'

RSpec.describe Authorization, :type => :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:invited_by) }
  it { should validate_presence_of(:role) }
end
