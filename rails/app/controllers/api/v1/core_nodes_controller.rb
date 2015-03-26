module Api
  module V1
    class CoreNodesController < AuthenticatedController

      def index
        core_nodes = CoreNode.all
        render json: core_nodes
      end

      def show
        core_node = CoreNode.find(params[:id])
        render json: core_node
      end

      def update
        core_node = CoreNode.find(params[:id])
        core_node.update_attributes(core_node_params)
        render json: core_node
      end

      def destroy
        core_node = CoreNode.find(params[:id])
        core_node.destroy
        render json: core_node
      end

      private

      def core_node_params
        params.require(:core_node).permit(:name, :status_id, :city_id, :location_id)
      end

    end
  end
end
