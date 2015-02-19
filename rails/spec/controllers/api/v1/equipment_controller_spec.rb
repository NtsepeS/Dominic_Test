require 'rails_helper'

RSpec.describe Api::V1::EquipmentController do
  let(:object_key) {:equipment}

  before(:each) do
    @equipment = create(:equipment)
  end

  describe 'GET /api/v1/equipment' do
    it_should_behave_like "a listable resource"
  end

  describe 'GET /api/v1/equipment/:id' do
    let(:id) {@equipment.id}

    it_should_behave_like "a viewable resource"
  end

  describe 'PUT /api/v1/equipment/:id' do
    let(:amendable_key) {:is_asset_tag}
    let(:amendable_value) {'another-asset-tag'}
    let(:id) {@equipment.id}

    it_should_behave_like "an amendable resource"
  end

  describe 'DELETE /api/v1/equipment/:id' do
    let(:id) {@equipment.id}

    it_should_behave_like "an erasable resource"
  end
end
