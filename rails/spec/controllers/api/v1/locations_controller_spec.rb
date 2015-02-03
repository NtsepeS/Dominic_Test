require 'rails_helper'
require 'pry'

RSpec.describe Api::V1::LocationsController do
  describe 'GET /api/v1/locations' do
    let(:resource) {:index}
    let(:object_key) {:locations}

    before(:each) do
      create(:location)
    end

    it_should_behave_like "a listable resource"
  end

  describe 'GET /api/v1/locations/:id' do
    let(:resource) {:show}
    let(:object_key) {:location}

    before(:each) do
      @location = create(:location)
    end

    let(:id) {@location.id}

    it_should_behave_like "a viewable resource"
  end

  describe 'PUT /api/v1/locations/:id' do
    before(:each) do
      @geometry = create(:geometry)
      @location = create(:location)
    end

    let(:resource) {:update}
    let(:object_key) {:location}
    let(:amendable_key) {:geometry_id}
    let(:amendable_value) {@geometry.id}
    let(:id) {@location.id}

    it_should_behave_like "an amendable resource"
  end

  describe 'DELETE /api/v1/locations/:id' do
    let(:resource) {:destroy}
    let(:object_key) {:location}

    before(:each) do
      @location = create(:location)
    end

    let(:id) {@location.id}

    it_should_behave_like "an erasable resource"
  end
end
