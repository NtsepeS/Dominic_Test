require 'rails_helper'

RSpec.describe FeatureFlag do
  subject { described_class.instance }

  describe ".enabled?" do
    it "should accept symbols" do
      expect( subject ).to receive(:[]).with("FEATURE_FOO").and_return("true")
      expect( described_class.enabled? :foo ).to be(true)
    end

    it "should accept dasherized names" do
      expect( subject ).to receive(:[]).with("FEATURE_FOO_BAR").and_return("true")
      expect( described_class.enabled? 'foo-bar' ).to be(true)
    end

    it "should be fine with missing values" do
      [ nil, 1, "rugby" ].each do |flag|
        expect( described_class.enabled? flag ).to be(false)
      end
    end
  end

  describe "#[]" do
    it "should read from the environment" do
      expect( ENV ).to receive(:[]).with("foo")

      subject["foo"]
    end
  end

end
