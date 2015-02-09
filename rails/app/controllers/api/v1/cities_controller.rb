module Api
  module V1
    class CitiesController < AuthenticatedController

      def index
        cities = City.all
        render json: cities
      end

      def show
        city = City.find(params[:id])
        render json: city
      end

      def update
        city = City.find(params[:id])
        city.update_attributes(city_params)
        render json: city
      end

      def destroy
        city = City.find(params[:id])
        city.destroy
        render json: city
      end

      private

      def city_params
        params.require(:city).permit(:name)
      end

    end
  end
end
