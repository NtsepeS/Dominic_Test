require 'rails_helper'

describe Port do
  it "should be valid" do
    Port.new.should be_valid
  end
end
