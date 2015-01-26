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

end