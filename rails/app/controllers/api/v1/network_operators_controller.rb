module Api
  module V1
    class NetworkOperatorsController < AuthenticatedController

      def index
        network_operator = NetworkOperator.all
        render json: {network_operators: network_operator}
      end

      def show
        network_operator = NetworkOperator.find(params[:id])
        render json: {network_operator: network_operator}
      end

      def update
        network_operator = NetworkOperator.find(params[:id])
        network_operator.update_attributes(network_operator_params)
        render json: {network_operator: network_operator}
      end

      def destroy
        network_operator = NetworkOperator.find(params[:id])
        network_operator.destroy
        render json: {network_operator: network_operator}
      end

      private

      def network_operator_params
        params['network_operator'].fetch(:network_operator, params['network_operator']).permit(:name)
      end

    end
  end
end
