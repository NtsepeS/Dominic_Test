module Api
  module V1
    class LocationsController < AuthenticatedController

      def index
        locations = Location.all
        render json: locations
      end

      def show
        location = Location.find(params[:id])
        render json: location
      end

      def update
        location = Location.find(params[:id])
        location.update_attributes(location_params)
        render json: location
      end

      def destroy
        location = Location.find(params[:id])
        location.destroy
        render json: location
      end

      private

      def location_params
        params.fetch(:location, params).permit(:geometry_id, :vicinity_id)
      end

    end
  end
end
