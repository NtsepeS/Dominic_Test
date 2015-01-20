module Api
  module V1
    class ClientsController < AuthenticatedController

      def index
        client = Client.all
        render json: {clients: client}
      end

      def show
        client = Client.find(params[:id])
        render json: {client: client}
      end

      def update
        client = Client.find(params[:id])
        client.update_attributes(client_params)
        render json: {client: client}
      end

      def destroy
        client = Client.find(params[:id])
        client.destroy
        render json: {client: client}
      end

      private

      def client_params
        params['client'].fetch(:client, params['client']).permit(:name)
      end

    end
  end
end
