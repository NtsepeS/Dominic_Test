module Api
  module V1
    class PicturesController < AuthenticatedController

      def index
        pictures = Picture.all
        render json: pictures
      end

      def show
        picture = Picture.find(params[:id])
        render json: picture
      end

      def update
        picture = Picture.find(params[:id])
        picture.update_attributes(picture_params)
        render json: picture
      end

      def destroy
        picture = Picture.find(params[:id])
        picture.destroy
        render json: picture
      end

      def create
        ap picture_params

        #  create an album
        album = Album.where(
          client_link_id: picture_params[:client_link_id],
          sub_group_classification_id: picture_params[:sub_group_classification_id]
        ).first_or_initialize

        album.save

        # newly created records
        puts "album:", album.id

        picture = Picture.new(picture_data: picture_params["picture_data"], album: album)

        if picture.save
          render json: album, status: :created
        else
          render json: picture.errors.to_json, status: :unprocessable_entity
        end
      end

      private

      def picture_params
        params.fetch(:picture, params).permit(
          :mechanism, :picture_data, :date_taken, :album_id, :sub_group_classification_id,
          :group_classification_id, :client_link_id
        )
      end

    end
  end
end
