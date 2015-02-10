module Api
  module V1
    class BaseStationUnitsController < AuthenticatedController

      def index
        base_station_units = BaseStationUnit.all
        render json: base_station_units
      end

      def show
        base_station_unit = BaseStationUnit.find(params[:id])
        render json: base_station_unit
      end

      def update
        base_station_unit = BaseStationUnit.find(params[:id])
        base_station_unit.update_attributes(base_station_unit_params)
        render json: base_station_unit
      end

      def destroy
        base_station_unit = BaseStationUnit.find(params[:id])
        base_station_unit.destroy
        render json: base_station_unit
      end

      private

      def base_station_unit_params
        params.require(:base_station_unit).permit(:name)
      end

    end
  end
end
