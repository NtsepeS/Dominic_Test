require 'rails_helper'

RSpec.describe Api::V1::RfPerformanceParametersController do
  let(:object_key) { :rf_performance_parameter }

  before(:each) do
    @rf_performance_parameter = create(:rf_performance_parameter)
  end

  describe 'GET /api/v1/rf_performance_parameters' do
    it_should_behave_like "a listable resource"
  end

  describe 'GET /api/v1/rf_performance_parameters/:id' do
    let(:id) { @rf_performance_parameter.id }

    it_should_behave_like "a viewable resource"
  end

  describe 'PUT /api/v1/rf_performance_parameters/:id' do
    let(:amendable_key) { :uplink_rssi }
    let(:amendable_value) { "1337" }
    let(:id) { @rf_performance_parameter.id }

    it_should_behave_like "an amendable resource"
  end

  describe 'DELETE /api/v1/rf_performance_parameters/:id' do
    let(:id) { @rf_performance_parameter.id }

    it_should_behave_like "an erasable resource"
  end

  describe 'POST /api/v1/rf_performance_parameters' do
    let(:hash) { {
      uplink_rssi: "123",
      downlink_rssi: "123",
      uplink_cnr: "123",
      downlink_cnr: "123",
      tx_power: "123",
      step_attenuator: "123"
    }
    }
    it_should_behave_like "a createable resource"
  end
end
