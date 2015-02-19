require 'rails_helper'

RSpec.describe Api::V1::ServicesController do
  let(:object_key) {:service}

  before(:each) do
    @service = create(:service)
  end

  describe 'GET /api/v1/services' do
    it_should_behave_like "a listable resource"
  end

  describe 'GET /api/v1/services/:id' do
    let(:id) {@service.id}

    it_should_behave_like "a viewable resource"
  end

  describe 'PUT /api/v1/services/:id' do
    let(:amendable_key) {:linetag}
    let(:amendable_value) {"MyString"}
    let(:id) {@service.id}

    it_should_behave_like "an amendable resource"
  end

  describe 'DELETE /api/v1/services/:id' do
    let(:id) {@service.id}

    it_should_behave_like "an erasable resource"
  end

  describe 'POST /api/v1/services' do
    let(:hash) { {linetag: "MyString", line_speed: "9.99", vlan: "MyText"} }
    it_should_behave_like "a createable resource"
  end
end
