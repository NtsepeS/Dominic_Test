require 'rails_helper'

describe ServiceFragment do
  it "should be valid" do
    ServiceFragment.new.should be_valid
  end
end
