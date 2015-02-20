require 'rails_helper'

RSpec.describe Api::V1::<%= pluralized_class_name %>Controller do
  let(:object_key) {:<%= singular_name %>}

  before(:each) do
    @<%= singular_name %> = create(:<%= singular_name %>)
  end

  describe 'GET /api/v1/<%= plural_name %>' do
    it_should_behave_like "a listable resource"
  end

  describe 'GET /api/v1/<%= plural_name %>/:id' do
    let(:id) {@<%= singular_name %>.id}

    it_should_behave_like "a viewable resource"
  end

  describe 'PUT /api/v1/<%= plural_name %>/:id' do
    let(:amendable_key) {:<%= attributes.first.name %>}
    let(:amendable_value) {"<%= factory_type(attributes.first.type)-%>"}
    let(:id) {@<%= singular_name %>.id}

    it_should_behave_like "an amendable resource"
  end

  describe 'DELETE /api/v1/<%= plural_name %>/:id' do
    let(:id) {@<%= singular_name %>.id}

    it_should_behave_like "an erasable resource"
  end

  describe 'POST /api/v1/<%= plural_name %>' do
    let(:hash) { {<% remove_references_attribute.each do |attr| -%><%= attr.name %>: "<%= factory_type(attr.type)-%>"<%= ", " unless attr == remove_references_attribute.last -%><% end -%>}}
    it_should_behave_like "a createable resource"
  end
end
