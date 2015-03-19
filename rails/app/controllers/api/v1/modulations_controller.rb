module Api
  module V1
    class ModulationsController < AuthenticatedController

      def index
        modulations = Modulation.all
        render json: modulations
      end

      def show
        modulation = Modulation.find(params[:id])
        render json: modulation
      end

      def create
        modulation = Modulation.new(modulation_params)
        if modulation.save
          render json: modulation, status: :created
        else
          render json: modulation.errors.to_json, status: :unprocessable_entity
        end
      end

      def update
        modulation = Modulation.find(params[:id])
        modulation.update_attributes(modulation_params)
        render json: modulation
      end

      def destroy
        modulation = Modulation.find(params[:id])
        modulation.destroy
        render json: modulation
      end

      def audit
        modulation     = Modulation.find(params[:id])
        version_history = papertrail_for(modulation)

        render json: version_history
      end

      private

      def modulation_params
        params.require(:modulation).permit(:downlink_min, :downlink_max, :uplink_min, :uplink_max, :modulation_result_set, :radio_id)
      end

    end
  end
end
