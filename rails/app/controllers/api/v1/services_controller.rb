module Api
  module V1
    class ServicesController < AuthenticatedController

      def index
        services = Service.all
        render json: services
      end

      def show
        service =  Service.find(params[:id])
        render json: service
      end

      def create
        service =  Service.new(service_params)
        if service.save
          render json: service, status: :created
        else
          render json: service.errors.to_json, status: :unprocessable_entity
        end
      end

      def update
        service =  Service.find(params[:id])
        service.update_attributes(service_params)
        render json: service
      end

      def destroy
        service =  Service.find(params[:id])
        service.destroy
        render json: service
      end

      private

      def service_params
        params.require(:service).permit(:linetag, :line_speed, :vlan, :service_fragment)
      end

    end
  end
end
