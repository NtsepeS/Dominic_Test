module Api
  module V1
    class GeometriesController < AuthenticatedController

      def index
        geometries = Geometry.all
        render json: geometries
      end

      def show
        geometry = Geometry.find(params[:id])
        render json: geometry
      end

      def update
        geometry = Geometry.find(params[:id])
        geometry.update_attributes(geometry_params)
        render json: geometry
      end

      def destroy
        geometry = Geometry.find(params[:id])
        geometry.destroy
        render json: geometry
      end

      private

      def geometry_params
        params.fetch(:geometry, params).permit(:name)
      end

    end
  end
end
