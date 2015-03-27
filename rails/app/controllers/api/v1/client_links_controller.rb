module Api
  module V1
    class ClientLinksController < AuthenticatedController
      include History
      include ExcelGenerator

      # GET /api/v1/client_links
      def index
        client_links = ClientLink.includes(
          { :client => :client_links }, :radio, :modem, { :antenna => :location },
          :sub_group_picture_sets, :service_fragments
        ).all
        render json: client_links
      end

      # GET /api/v1/client_links/:id
      def show
        client_link = ClientLink.find(params[:id])
        render json: client_link
      end

      def parent_container
        type = [ :base_station_sector_id ].detect { |key|
          params[:client_link][ key ].present?
        }

        return if type.nil?

        parent_class = type.to_s.sub(/_id\z/, '').classify.safe_constantize
        if parent_class.present?
          id = params[:client_link].delete( type )
          parent_class.find( id )
        end
      end

      def create
        # Run before our safe parameters
        container = parent_container

        client_link = ClientLink.new(client_link_params)
        ncs = NewContainerService.new.create( client_link, in: container )

        if ncs.successful?
          render json: ncs.containable, status: :created
        else
          render json: ncs.errors.to_json, status: :unprocessable_entity
        end
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

      # GET /api/v1/client_links/:id/audit
      def audit
        client_link     = ClientLink.find(params[:id])
        version_history = papertrail_for(client_link)

        render json: version_history
      end

      # GET /api/v1/client_links/export
      def export
        client_links = ClientLink.all
        excel        = ExcelExporter.new(client_links)

        generate(excel)
      end

      private

      def client_link_params
        @_client_link_params ||= params.require(:client_link).permit(
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
          :network_operator_id,
          :solution_identifier,
          :billing_account,
          :service_account,
          :service_account_site,
        )

      end

    end
  end
end
