require 'rails_helper'

RSpec.describe Api::V1::BaseStationUnitsController do
  let(:object_key) {:base_station_unit}

  before(:each) do
    @base_station_unit = create_base_station_unit
    sign_in( :user )
  end

  describe 'GET /api/v1/base_station_units' do
    it_should_behave_like "a listable resource"
  end

  describe 'GET /api/v1/base_station_units/:id' do
    let(:id) {@base_station_unit.id}

    it_should_behave_like "a viewable resource"
  end

  describe 'PUT /api/v1/base_station_units/:id' do
    let(:amendable_key) {:name}
    let(:amendable_value) {"Oh look! a name..."}
    let(:id) {@base_station_unit.id}

    it_should_behave_like "an amendable resource"
  end

  describe 'DELETE /api/v1/base_station_units/:id' do
    let(:id) {@base_station_unit.id}

    it_should_behave_like "an erasable resource"
  end

  describe 'POST /api/v1/base_station_units' do
    let(:core_node) { create_core_node }

    let(:hash) {
      attrs = FactoryGirl.attributes_for(:base_station_unit)
      attrs[:core_node_id] = core_node.id
      attrs
    }

    it_should_behave_like "a createable resource"
  end
end

