require 'rails_helper'
require 'pry'

RSpec.describe Api::V1::GeometriesController do
  describe 'GET /api/v1/geometries' do
    let(:resource) {:index}
    let(:object_key) {:geometries}

    before(:each) do
      create(:geometry)
    end

    it_should_behave_like "a listable resource"
  end

  describe 'GET /api/v1/geometries/:id' do
    let(:resource) {:show}
    let(:object_key) {:geometry}

    before(:each) do
      @geometry = create(:geometry)
    end

    let(:id) {@geometry.id}

    it_should_behave_like "a viewable resource"
  end

  describe 'PUT /api/v1/geometries/:id' do
    let(:resource) {:update}
    let(:object_key) {:geometry}
    let(:amendable_key) {:longitude}
    let(:amendable_value) {"1234567890.0"}

    before(:each) do
      @geometry = create(:geometry)
    end

    let(:id) {@geometry.id}

    it_should_behave_like "an amendable resource"
  end

  describe '#destroy' do
  end
end
