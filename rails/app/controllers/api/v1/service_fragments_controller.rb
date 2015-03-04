module Api
  module V1
    class ServiceFragmentsController < AuthenticatedController

      def index
        service_fragments = ServiceFragment.all
        render json: service_fragments
      end

      def show
        service_fragment =  ServiceFragment.find(params[:id])
        render json: service_fragment
      end

      def create
        service_fragment =  ServiceFragment.new(service_fragment_params)
        if service_fragment.save
          render json: service_fragment, status: :created
        else
          render json: service_fragment.errors.to_json, status: :unprocessable_entity
        end
      end

      def update
        service_fragment =  ServiceFragment.find(params[:id])
        service_fragment.update_attributes(service_fragment_params)
        render json: service_fragment
      end

      def destroy
        service_fragment =  ServiceFragment.find(params[:id])
        service_fragment.destroy
        render json: service_fragment
      end

      private

      def service_fragment_params
        params.require(:service_fragment).permit(:work_order_number, :line_speed, :service_type, :physical_mode, :client_link_id)
      end

    end
  end
end
