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

      private

      def picture_params
        params.fetch(:picture, params).permit(:mechanism, :picture_data, :date_taken, :album_id)
      end

    end
  end
end
