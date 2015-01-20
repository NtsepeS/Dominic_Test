module Api
  module V1
    class BaseStationSectorsController < AuthenticatedController

      def index
        base_station_sector = BaseStationSector.all
        render json: base_station_sector
      end

      def show
        base_station_sector = BaseStationSector.find(params[:id])
        render json: base_station_sector
      end

      def update
        base_station_sector = BaseStationSector.find(params[:id])
        base_station_sector.update_attributes(base_station_sector_params)
        render json: base_station_sector
      end

      def destroy
        base_station_sector = BaseStationSector.find(params[:id])
        base_station_sector.destroy
        render json: base_station_sector
      end

      private

      def base_station_sector_params
        params['base_station_sector'].fetch(:base_station_sector, params['base_station_sector']).permit(:name)
      end

    end
  end
end
