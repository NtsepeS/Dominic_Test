require "rails_helper"

RSpec.describe ApplicationSerializer do
  describe '.lowercase_attribute' do
    subject do
      klass = Class.new(ApplicationSerializer) do
        lowercase_attribute :MAC_address

        attr_accessor :MAC_address
      end

      klass.new(model)
    end

    let(:model) {
      ClientLink.new(MAC_address: "00:55:33")
    }

    it "sets up an attribute for us" do
      expect( subject ).to respond_to(:mac_address)
    end

    it "should return the same value" do
      expect( subject.mac_address ).to eq( model.MAC_address )
    end
  end
end
