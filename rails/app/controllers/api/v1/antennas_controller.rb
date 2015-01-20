module Api
  module V1
    class AntennasController < AuthenticatedController

      def index
        antenna = Antenna.all
        render json: antenna
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
        params.fetch(:antenna, params).permit(:name)
      end

    end
  end
end
