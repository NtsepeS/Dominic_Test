module Api
  module V1
    class AntennasController < AuthenticatedController

      def index
        antennas = Antenna.all
        render json: antennas
      end

      def show
        antenna = Antenna.find(params[:id])
        render json: antenna
      end

      def update
        antenna = Antenna.find(params[:id])
        antenna.update_attributes(antenna_params)
        render json: antenna
      end

      def destroy
        antenna = Antenna.find(params[:id])
        antenna.destroy
        render json: antenna
      end

      private

      def antenna_params
        params.require(:antenna).permit(:name)
      end

    end
  end
end
