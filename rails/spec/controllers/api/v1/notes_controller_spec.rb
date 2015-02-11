require 'rails_helper'

RSpec.describe Api::V1::NotesController do
  let(:object_key) {:note}

  before(:each) do
    @note = create(:note)
  end

  describe 'GET /api/v1/notes' do
    it_should_behave_like "a listable resource"
  end

  describe 'POST /api/v1/notes' do
    let(:hash) { {text: "A new note!"} }

    it_should_behave_like "a createable resource"
  end

  describe 'GET /api/v1/notes/:id' do
    let(:id) {@note.id}

    it_should_behave_like "a viewable resource"
  end

  describe 'PUT /api/v1/notes/:id' do
    let(:amendable_key) {:text}
    let(:amendable_value) {"This is a note!!!!"}
    let(:id) {@note.id}

    it_should_behave_like "an amendable resource"
  end

  describe 'DELETE /api/v1/notes/:id' do
    let(:id) {@note.id}

    it_should_behave_like "an erasable resource"
  end
end
