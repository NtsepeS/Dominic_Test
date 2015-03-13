require 'rails_helper'

RSpec.describe Api::V1::LocationsController do
  let(:object_key) { :location }

  before(:each) do
    @location = create(:location)
    sign_in( :user )
  end

  describe 'GET /api/v1/locations' do
    it_should_behave_like "a listable resource"
  end

  describe 'GET /api/v1/locations/:id' do
    let(:id) { @location.id }

    it_should_behave_like "a viewable resource"
  end

  describe 'PUT /api/v1/locations/:id' do
    let (:geometry) { create(:geometry) }
    let(:amendable_key) { :geometry_id }
    let(:amendable_value) { geometry.id }
    let(:id) { @location.id }

    it_should_behave_like "an amendable resource"
  end

  describe 'DELETE /api/v1/locations/:id' do
    let(:id) { @location.id }

    it_should_behave_like "an erasable resource"
  end
end
