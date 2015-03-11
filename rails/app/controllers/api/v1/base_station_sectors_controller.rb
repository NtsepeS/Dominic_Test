module Api
  module V1
    class BaseStationSectorsController < AuthenticatedController
      include ExcelGenerator

      def index
        base_station_sectors = BaseStationSector.all
        render json: base_station_sectors
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

      def export
        base_station_sectors = BaseStationSector.all
        excel                = ExcelExporter.new(base_station_sectors)

        generate(excel)
      end

      private

      def base_station_sector_params
        params.require(:base_station_sector).permit(:name)
      end

    end
  end
end
