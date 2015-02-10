module Api
  module V1
    class LinkTypesController < AuthenticatedController

      # GET /api/v1/link_types
      def index
        link_types = LinkType.all
        render json: link_types
      end

      # GET /api/v1/link_types/:id
      def show
        link_type = LinkType.find(params[:id])
        render json: link_type
      end

      # PUT /api/v1/link_types/:id
      def update
        link_type = LinkType.find(params[:id])
        link_type.update_attributes(link_type_params)
        render json: link_type
      end

      # DELETE /api/v1/link_types/:id
      def destroy
        link_type = LinkType.find(params[:id])
        link_type.destroy
        render json: link_type
      end

      private

      def link_type_params
        params.require(:link_type).permit(:name)
      end

    end
  end
end
