module Api
  module V1
    class RfPerformanceParametersController < AuthenticatedController

      def index
        rf_performance_parameters = RfPerformanceParameter.all
        render json: rf_performance_parameters
      end

      def show
        rf_performance_parameter = RfPerformanceParameter.find(params[:id])
        render json: rf_performance_parameter
      end

      def update
        rf_performance_parameter = RfPerformanceParameter.find(params[:id])
        rf_performance_parameter.update_attributes(rf_performance_parameter_params)
        render json: rf_performance_parameter
      end

      def destroy
        rf_performance_parameter = RfPerformanceParameter.find(params[:id])
        rf_performance_parameter.destroy
        render json: rf_performance_parameter
      end

      def create
        rf_performance_parameter = RfPerformanceParameter.new(rf_performance_parameter_params)

        if rf_performance_parameter.save
          render json: rf_performance_parameter, status: :created
        else
          render json: rf_performance_parameter.errors.to_json, status: :unprocessable_entity
        end

      end

      private

      def rf_performance_parameter_params
        params.require(:rf_performance_parameter).permit(:uplink_rssi, :downlink_rssi, :uplink_cni, 
                                                          :downlink_cni, :tx_power, :step_attenuator)
      end

    end
  end
end
