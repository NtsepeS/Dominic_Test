require 'rails_helper'

RSpec.describe Api::V1::VicinitiesController do
  describe 'GET /api/v1/vicinities' do
    let(:resource) {:index}
    let(:object_key) {:vicinities}

    before(:each) do
      create(:vicinity)
    end

    it_should_behave_like "a listable resource"
  end

  describe 'GET /api/v1/vicinities/:id' do
    let(:resource) {:show}
    let(:object_key) {:vicinity}

    before(:each) do
      @vicinity = create(:vicinity)
    end

    let(:id) {@vicinity.id}

    it_should_behave_like "a viewable resource"
  end

  describe 'PUT /api/v1/vicinities/:id' do
    let(:resource) {:update}
    let(:object_key) {:vicinity}
    let(:amendable_key) {:physical_address}
    let(:amendable_value) {"P. Sherman 42 Wallaby Way, Sydney"}

    before(:each) do
      @vicinity = create(:vicinity)
    end

    let(:id) {@vicinity.id}

    it_should_behave_like "an amendable resource"
  end

  describe 'DELETE /api/v1/vicinities/:id' do
    let(:resource) {:destroy}
    let(:object_key) {:vicinity}

    before(:each) do
      @vicinity = create(:vicinity)
    end

    let(:id) {@vicinity.id}

    it_should_behave_like "an erasable resource"
  end
end
