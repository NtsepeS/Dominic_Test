require 'rails_helper'

RSpec.describe Api::V1::ClientLinksController do
  let(:object_key) {:client_link}

  before(:each) do
    @client_link = create(:client_link)
  end

  describe 'GET /api/v1/geometries' do
    it_should_behave_like "a listable resource"
  end

  describe 'GET /api/v1/geometries/:id' do
    let(:id) {@client_link.id}

    it_should_behave_like "a viewable resource"
  end

  describe 'PUT /api/v1/geometries/:id' do
    let(:amendable_key) {:name}
    let(:amendable_value) {"Oh look! a name..."}
    let(:id) {@client_link.id}

    it_should_behave_like "an amendable resource"
  end

  describe 'DELETE /api/v1/geometries/:id' do
    let(:id) {@client_link.id}

    it_should_behave_like "an erasable resource"
  end

  describe 'POST /api/v1/client_links' do
    let(:hash) { {name: 'Alice Cooper',
      branch: 'Some branch',
      circuit_number: '1-19BL0L4-W-ISANDO-BSU1',
      msad_number: "4.22",
      activation_date: '',
      mac_address: '00:05:59:4C:36:9E',
      distance: '765',
      client_id: 1,
      status_id: 4,
      link_type_id: '',
      antenna_id: 1,
      network_operator_id: 1,
      base_station_sector_id: 1,
      solution_identifier: 1,
      billing_account: 1,
      service_account: 1,
      service_account_site: 1}
    }

    it_should_behave_like "a createable resource"
  end
end
