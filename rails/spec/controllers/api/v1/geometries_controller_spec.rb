require 'rails_helper'

RSpec.describe Api::V1::GeometriesController do
  let(:object_key) {:geometry}

  before(:each) do
    @geometry = create(:geometry)
  end

  describe 'GET /api/v1/geometries' do
    it_should_behave_like "a listable resource"
  end

  describe 'GET /api/v1/geometries/:id' do
    let(:id) {@geometry.id}

    it_should_behave_like "a viewable resource"
  end

  describe 'PUT /api/v1/geometries/:id' do
    let(:amendable_key) {:longitude}
    let(:amendable_value) {"1234567890.0"}
    let(:id) {@geometry.id}

    it_should_behave_like "an amendable resource"
  end

  describe 'DELETE /api/v1/geometries/:id' do
    let(:id) {@geometry.id}

    it_should_behave_like "an erasable resource"
  end
end
