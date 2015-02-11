module Api
  module V1
    class NotesController < AuthenticatedController

      # GET /api/v1/notes
      def index
        notes = Note.all
        render json: notes
      end

      # POST /api/v1/notes
      def create
        note = Note.new(note_params)
        if note.save
          render json: note, status: :created
        else
          render json: note.errors.to_json, status: :unprocessable_entity
        end
      end

      # GET /api/v1/notes/:id
      def show
        note = Note.find(params[:id])
        render json: note
      end

      # PUT /api/v1/notes/:id
      def update
        note = Note.find(params[:id])
        note.update_attributes(note_params)
        render json: note
      end

      # DELETE /api/v1/notes/:id
      def destroy
        note = Note.find(params[:id])
        note.destroy
        render json: note
      end

      private

      def note_params
        params.require(:note).permit(:text)
      end

    end
  end
end
