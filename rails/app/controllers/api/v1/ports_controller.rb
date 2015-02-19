module Api
  module V1
    class PortsController < AuthenticatedController

      def index
        ports = Port.all
        render json: ports
      end

      def show
        port =  Port.find(params[:id])
        render json: port
      end

      def create
        port =  Port.new(port_params)
        if port.save
          render json: port, status: :created
        else
          render json: port.errors.to_json, status: :unprocessable_entity
        end
      end

      def update
        port =  Port.find(params[:id])
        port.update_attributes(port_params)
        render json: port
      end

      def destroy
        port =  Port.find(params[:id])
        port.destroy
        render json: port
      end

      private

      def port_params
        params.require(:port).permit(:vlan_type, :acceptable_frame_type, :default_vlan, :service)
      end

    end
  end
end
