module Api
  module V1
    class ClientsController < AuthenticatedController

      def index
        clients = Client.all
        render json: clients
      end

      def show
        client = Client.find(params[:id])
        render json: client
      end

      def update
        client = Client.find(params[:id])
        client.update_attributes(client_params)
        render json: client
      end

      def destroy
        client = Client.find(params[:id])
        client.destroy
        render json: client
      end

      private

      def client_params
        params.fetch(:client, params).permit(:name)
      end

    end
  end
end
