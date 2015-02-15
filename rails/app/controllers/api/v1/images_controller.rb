module Api
  module V1
    class ImagesController < AuthenticatedController

      def index
        images = Image.all
        render json: images
      end

      def show
        image = Image.find(params[:id])
        render json: image
      end

      def update
        image = Image.find(params[:id])
        image.update_attributes(image_params)
        render json: image
      end

      def destroy
        image = Image.find(params[:id])
        image.destroy
        render json: image
      end

      def create
        ap params
        image = Image.new(image_params)
        if image.save
          render json: image, status: :created
        else
          render json: image.errors.to_json, status: :unprocessable_entity
        end

      end

      private

      def image_params
        params.fetch(:image, params).permit(:image_data)
      end

    end
  end
end
