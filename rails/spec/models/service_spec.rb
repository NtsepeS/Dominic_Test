require 'rails_helper'

describe Service do
  it "should be valid" do
    Service.new.should be_valid
  end
end
