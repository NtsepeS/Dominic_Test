module Api
  module V1
    class ClientLinksController < AuthenticatedController

      # GET /api/v1/client_links
      def index
        client_link = ClientLink.all
        render json: client_link
      end

      # GET /api/v1/client_links/:id
      def show
        client_link = ClientLink.find(params[:id])
        render json: client_link
      end

      # PUT /api/v1/client_links/:id
      def update
        client_link = ClientLink.find(params[:id])
        client_link.update_attributes(client_link_params)
        render json: client_link
      end

      # DELETE /api/v1/client_links/:id
      def destroy
        client_link = ClientLink.find(params[:id])
        client_link.destroy
        render json: client_link
      end

      private

      def client_link_params
        params.fetch(:client_link, params).permit(:name, :branch, :circuit_number, :MSAD_number)
      end

    end
  end
end