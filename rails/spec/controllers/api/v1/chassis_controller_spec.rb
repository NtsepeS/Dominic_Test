require 'rails_helper'

RSpec.describe Api::V1::ChassisController do
  let(:object_key) {:chassis}

  before(:each) do
    @chassis = create(:chassis)
    sign_in( :user )
  end

  describe 'GET /api/v1/chassis' do
    it_should_behave_like "a listable resource"
  end

  describe 'GET /api/v1/chassis/:id' do
    let(:id) {@chassis.id}

    it_should_behave_like "a viewable resource"
  end

  # Commented out for now - chassis only as id attribute
  # Should we allow the id to be updated?
  xdescribe 'PUT /api/v1/chassis/:id' do
    let(:amendable_key) {:id}
    let(:amendable_value) {"123"}
    let(:id) {@chassis.id}

    it_should_behave_like "an amendable resource"
  end

  describe 'DELETE /api/v1/chassis/:id' do
    let(:id) {@chassis.id}

    it_should_behave_like "an erasable resource"
  end
end
