module Api
  module V1
    class <%= pluralized_class_name %>Controller < AuthenticatedController

      def index
        <%= plural_name %> = <%= class_name %>.all
        render json: <%= plural_name %>
      end

      def show
        <%= singular_name %> =  <%= class_name %>.find(params[:id])
        render json: <%= singular_name %>
      end

      def create
        <%= singular_name %> =  <%= class_name %>.new(<%= singular_name %>_params)
        if <%= singular_name %>.save
          render json: <%= singular_name %>, status: :created
        else
          render json: <%= singular_name %>.errors.to_json, status: :unprocessable_entity
        end
      end

      def update
        <%= singular_name %> =  <%= class_name %>.find(params[:id])
        <%= singular_name %>.update_attributes(<%= singular_name %>_params)
        render json: <%= singular_name %>
      end

      def destroy
        <%= singular_name %> =  <%= class_name %>.find(params[:id])
        <%= singular_name %>.destroy
        render json: <%= singular_name %>
      end

      private

      def <%= singular_name %>_params
        params.require(:<%= singular_name %>).permit(<% attributes.each do |attr| -%>:<%= attr.name %><%= ", " unless attr == attributes.last -%><% end -%>)
      end

    end
  end
end
