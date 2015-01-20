module Api
  module V1
    class CoreNodesController < AuthenticatedController

      def index
        core_node = CoreNode.all
        render json: core_node
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
        params['core_node'].fetch(:core_node, params['core_node']).permit(:name)
      end

    end
  end
end
