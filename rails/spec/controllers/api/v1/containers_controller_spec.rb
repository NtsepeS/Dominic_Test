require 'rails_helper'

RSpec.describe Api::V1::ContainersController do
  let(:object_key) {:container}

  before(:each) do
    @container = create(:container)
    sign_in( :user )
  end

  describe 'GET /api/v1/containers' do
    it_should_behave_like "a listable resource"
  end

  describe 'GET /api/v1/containers/:id' do
    let(:id) {@container.id}

    it_should_behave_like "a viewable resource"
  end

  describe 'PUT /api/v1/containers/:id' do
    let (:core_node) { create(:core_node) }
    let(:amendable_key) { :containable_id }
    let(:amendable_value) { core_node.id }
    let(:id) { @container.id }

    it_should_behave_like "an amendable resource"
  end

  describe 'DELETE /api/v1/containers/:id' do
    let(:id) {@container.id}

    it_should_behave_like "an erasable resource"
  end
end
