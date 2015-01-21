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

      def create
        client_link = ClientLink.new(client_link_params)
        client_link.save
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

        params.fetch(:client_link, params).permit(
          :name,
          :branch,
          :circuit_number,
          :msad_number,
          :activation_date,
          :mac_address,
          :distance,
          :client_id,
          :status_id,
          :link_type_id,
          :antenna_id,
          :network_operator_id,
          :base_station_sector_id,
          :solution_identifier,
          :billing_account,
          :service_account,
          :service_account_site,
        )

      end

    end
  end
end
