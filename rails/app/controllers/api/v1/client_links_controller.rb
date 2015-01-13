module Api
  module V1
    class ClientLinksController < AuthenticatedController

      # GET /api/v1/client_links
      def index
        client_link = ClientLink.all
        render json: {client_links: client_link}
      end

      def show
        client_link = ClientLink.find(params[:id])
        render json: {client_link: client_link}
      end

    end
  end
end