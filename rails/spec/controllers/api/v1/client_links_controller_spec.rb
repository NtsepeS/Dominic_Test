require 'rails_helper'

RSpec.describe Api::V1::ClientLinksController do

  describe '#index' do

    # only when you call client_link does it actually create that record
    # so use let! or before do.. To test, try ClientLink.count

    before do
      3.times {create(:client_link)}
      get :index
      @data = JSON.parse(response.body)
    end

    it 'returns http ok status' do
      expect(response).to be_ok
    end

    it 'returns an outer key of client_links' do
      expect(@data).to have_key('client_links')
    end

    it 'returns greater than zero records' do
      expect(@data['client_links'].size).to eq(3)
      expect(@data['client_links']).not_to be_empty
    end

    it 'returns a JSON array of client links' do
      expect(@data['client_links']).to be_an(Array)
    end

  end

  describe '#show' do
    context 'for a valid id' do

      let(:client_link) {create(:client_link)}

      before do
        get :show, id: client_link.id
        @data = JSON.parse(response.body)
      end

      it 'returns http ok status' do
        expect(response).to be_ok
      end

      it 'returns an outer key of client_link' do
        expect(@data).to have_key('client_link')
      end

      it 'returns a Hash of information' do
        expect(@data['client_link']).to be_a(Hash)
      end

      it 'returns results containing the appropriate keys' do
        expect(@data['client_link'].keys.map(&:to_sym)).to include(:name, :branch,
          :circuit_number, :mac_address, :msad_number, :activation_date, :distance,
          :solution_identifier, :billing_account, :service_account,
          :service_account_site, :created_at, :updated_at, :client_id, :link_type_id,
          :antenna_id, :network_operator_id, :base_station_sector_id, :status_id
        )
      end

      # it 'returns the hash of foreign keys in the outer hash' do
      #   @data['client_link'].keys.each do |key|
      #     if key=~ /_id$/
      #       puts common = key.partition('_').first
      #       expect(@data.keys).to include(common)
      #     end
      #   end
      # end

    end

    context 'for an invalid id' do

      let(:client_link) {create(:client_link)}
      let :non_existent_id do
        id = client_link.id
        client_link.destroy
        id
      end

      before do
          get :show, id: non_existent_id
      end

       it 'returns http not found status' do
        expect(response.status).to be 404
      end

    end
  end

end
