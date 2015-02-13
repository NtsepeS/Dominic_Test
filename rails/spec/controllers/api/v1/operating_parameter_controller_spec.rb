require 'rails_helper'

RSpec.describe Api::V1::OperatingParametersController do
  let(:object_key) { :operating_parameter }

  before(:each) do
    @operating_parameter = create(:operating_parameter)
  end

  describe 'GET /api/v1/operating_parameters' do
    it_should_behave_like "a listable resource"
  end

  describe 'GET /api/v1/operating_parameters/:id' do
    let(:id) { @operating_parameter.id }

    it_should_behave_like "a viewable resource"
  end

  describe 'PUT /api/v1/operating_parameters/:id' do
    let(:location) { create(:location) }
    let(:amendable_key) { :location_id }
    let(:amendable_value) { location.id }
    let(:id) { @operating_parameter.id }

    it_should_behave_like "an amendable resource"
  end

  describe 'DELETE /api/v1/operating_parameters/:id' do
    let(:id) { @operating_parameter.id }

    it_should_behave_like "an erasable resource"
  end

  describe 'POST /api/v1/client_links' do
    let(:location) { create(:location) }
    let(:hash) {
      {
        location_id: location.id
      }
    }
    it_should_behave_like "a createable resource"
  end

end
