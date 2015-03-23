require 'rails_helper'

RSpec.describe Api::V1::ModulationsController do
  let(:object_key) {:modulation}

  before(:each) do
    @modulation = create(:modulation)
    sign_in( :user )
  end

  describe 'GET /api/v1/modulations' do
    it_should_behave_like "a listable resource"
  end

  describe 'GET /api/v1/modulations/:id' do
    let(:id) {@modulation.id}

    it_should_behave_like "a viewable resource"
  end

  describe 'PUT /api/v1/modulations/:id' do
    let(:amendable_key) {:downlink_min}
    let(:amendable_value) {"value"}
    let(:id) {@modulation.id}

    it_should_behave_like "an amendable resource"
  end

  describe 'DELETE /api/v1/modulations/:id' do
    let(:id) {@modulation.id}

    it_should_behave_like "an erasable resource"
  end

  describe 'POST /api/v1/modulations' do
    let(:hash) {
      {
        downlink_min: 64,
        downlink_max: 64,
        uplink_min: 64,
        uplink_max: 64
      }
    }
    it_should_behave_like "a createable resource"
  end
end
