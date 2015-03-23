module Api
  module V1
    class BaseStationUnitsController < AuthenticatedController
      include ExcelGenerator

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

      def export
        base_station_units = BaseStationUnit.all
        excel              = ExcelExporter.new(base_station_units)

        generate(excel)
      end

      private

      def base_station_unit_params
        params.require(:base_station_unit).permit(:name, :status_id, :core_node_id)
      end

    end
  end
end
