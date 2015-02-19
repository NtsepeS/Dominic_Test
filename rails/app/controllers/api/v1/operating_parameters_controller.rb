module Api
  module V1
    class OperatingParametersController < AuthenticatedController

      def index
        operating_parameters = OperatingParameter.all
        render json: operating_parameters
      end

      def show
        operating_parameter = OperatingParameter.find(params[:id])
        render json: operating_parameter
      end

      def update
        operating_parameter = OperatingParameter.find(params[:id])
        operating_parameter.update_attributes(operating_parameter_params)
        render json: operating_parameter
      end

      def destroy
        operating_parameter = OperatingParameter.find(params[:id])
        operating_parameter.destroy
        render json: operating_parameter
      end

      def create
        operating_parameter = OperatingParameter.new(operating_parameter_params)

        if operating_parameter.save
          render json: operating_parameter, status: :created
        else
          render json: operating_parameter.errors.to_json, status: :unprocessable_entity
        end

      end

      private

      def operating_parameter_params
        params.require(:operating_parameter).permit(:location_id)
      end

    end
  end
end
