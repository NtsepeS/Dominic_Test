module Api
  module V1
    class VicinitiesController < AuthenticatedController

      def index
        vicinities = Vicinity.all
        render json: vicinities
      end

      def show
        vicinity = Vicinity.find(params[:id])
        render json: vicinity
      end

      def update
        vicinity = Vicinity.find(params[:id])
        vicinity.update_attributes(vicinity_params)
        render json: vicinity
      end

      def destroy
        vicinity = Vicinity.find(params[:id])
        vicinity.destroy
        render json: vicinity
      end

      private

      def vicinity_params
        params.fetch(:vicinity, params).permit(:name)
      end

    end
  end
end
