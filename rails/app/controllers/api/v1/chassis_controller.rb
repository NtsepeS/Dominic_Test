module Api
  module V1
    class ChassisController < AuthenticatedController

      def index
        chassis = Chassis.all
        render json: chassis
      end

      def show
        chassis = Chassis.find(params[:id])
        render json: chassis
      end

      def update
        chassis = Chassis.find(params[:id])
        chassis.update_attributes(chassis_params)
        render json: chassis
      end

      def destroy
        chassis = Chassis.find(params[:id])
        chassis.destroy
        render json: chassis
      end

      private

      def chassis_params
        params.require(:chassis).permit(:name)
      end

    end
  end
end
