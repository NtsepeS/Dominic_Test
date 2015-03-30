require 'rails_helper'

RSpec.describe Api::V1::CoreNodesController do
  let(:object_key) {:core_node}

  before(:each) do
    @core_node = create_core_node
    sign_in( :user )
  end

  describe 'GET /api/v1/core_nodes' do
    it_should_behave_like "a listable resource"
  end

  describe 'GET /api/v1/core_nodes/:id' do
    let(:id) {@core_node.id}

    it_should_behave_like "a viewable resource"
  end

  describe 'PUT /api/v1/core_nodes/:id' do
    let(:amendable_key) {:name}
    let(:amendable_value) {"Oh look! a name..."}
    let(:id) {@core_node.id}

    it_should_behave_like "an amendable resource"
  end

  describe 'DELETE /api/v1/core_nodes/:id' do
    let(:id) {@core_node.id}

    it_should_behave_like "an erasable resource"
  end

  describe 'POST /api/v1/core_nodes' do
    let (:status)   { FactoryGirl.create(:status) }
    let (:city)     { FactoryGirl.create(:city) }
    let (:location) { FactoryGirl.create(:location) }

    # FactoryGirl 'attributes_for' does not build
    # associations so we have to set them manually
    let(:hash) {
      attrs = FactoryGirl.attributes_for(:core_node)
      attrs[:status_id]   = status.id
      attrs[:city_id]     = city.id
      attrs[:location_id] = location.id

      attrs
    }

    it_should_behave_like "a createable resource"
  end
end

