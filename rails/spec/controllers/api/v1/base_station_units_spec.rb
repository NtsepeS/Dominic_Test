require 'rails_helper'

RSpec.describe Api::V1::BaseStationUnitsController do
  let(:object_key) {:base_station_unit}

  before(:each) do
    @base_station_unit = create(:base_station_unit)
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
      let(:hash) { {name: 'Some Sector',
      status_id: 1,
      core_node_id: 1}
    }
    it_should_behave_like "a createable resource"
  end
end
