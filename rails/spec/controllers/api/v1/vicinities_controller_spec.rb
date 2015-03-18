require 'rails_helper'

RSpec.describe Api::V1::VicinitiesController do
  let(:object_key) {:vicinity}

  before(:each) do
    @vicinity = create(:vicinity)
    sign_in( :user )
  end

  describe 'GET /api/v1/vicinities' do
    it_should_behave_like "a listable resource"
  end

  describe 'GET /api/v1/vicinities/:id' do
    let(:id) {@vicinity.id}

    it_should_behave_like "a viewable resource"
  end

  describe 'PUT /api/v1/vicinities/:id' do
    let(:amendable_key) {:physical_address}
    let(:amendable_value) {"P. Sherman 42 Wallaby Way, Sydney"}
    let(:id) {@vicinity.id}

    it_should_behave_like "an amendable resource"
  end

  describe 'DELETE /api/v1/vicinities/:id' do
    let(:id) {@vicinity.id}

    it_should_behave_like "an erasable resource"
  end
end
