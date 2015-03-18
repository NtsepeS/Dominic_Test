require 'rails_helper'

RSpec.describe Api::V1::ServiceFragmentsController do
  let(:object_key) {:service_fragment}

  before(:each) do
    @service_fragment = create(:service_fragment)
    sign_in( :user )
  end

  describe 'GET /api/v1/service_fragments' do
    it_should_behave_like "a listable resource"
  end

  describe 'GET /api/v1/service_fragments/:id' do
    let(:id) {@service_fragment.id}

    it_should_behave_like "a viewable resource"
  end

  describe 'PUT /api/v1/service_fragments/:id' do
    let(:amendable_key) {:work_order_number}
    let(:amendable_value) {"MyString"}
    let(:id) {@service_fragment.id}

    it_should_behave_like "an amendable resource"
  end

  describe 'DELETE /api/v1/service_fragments/:id' do
    let(:id) {@service_fragment.id}

    it_should_behave_like "an erasable resource"
  end

  describe 'POST /api/v1/service_fragments' do
    let(:hash) { {      work_order_number: "MyString",             line_speed: "9.99",             service_type: "MyString",             physical_mode: "MyString"      }
    }
    it_should_behave_like "a createable resource"
  end
end
