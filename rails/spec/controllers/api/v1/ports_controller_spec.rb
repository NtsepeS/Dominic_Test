require 'rails_helper'

RSpec.describe Api::V1::PortsController do
  let(:object_key) {:port}

  before(:each) do
    @port = create(:port)
    sign_in( :user )
  end

  describe 'GET /api/v1/ports' do
    it_should_behave_like "a listable resource"
  end

  describe 'GET /api/v1/ports/:id' do
    let(:id) {@port.id}

    it_should_behave_like "a viewable resource"
  end

  describe 'PUT /api/v1/ports/:id' do
    let(:amendable_key) {:vlan_type}
    let(:amendable_value) {"MyString"}
    let(:id) {@port.id}

    it_should_behave_like "an amendable resource"
  end

  describe 'DELETE /api/v1/ports/:id' do
    let(:id) {@port.id}

    it_should_behave_like "an erasable resource"
  end

  describe 'POST /api/v1/ports' do
    let(:hash) { { vlan_type: "MyString", acceptable_frame_type: "MyString", default_vlan: "MyString" } }
    it_should_behave_like "a createable resource"
  end
end
