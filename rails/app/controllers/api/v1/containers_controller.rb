module Api
  module V1
    class ContainersController < AuthenticatedController

      def index
        containers = Container.all
        render json: containers
      end

      def show
        container = Container.find(params[:id])
        render json: container
      end

      def create
        container = Container.new(container_params)

        if container.save
          render json: container, status: :created
        else
          render json: container.errors.to_json, status: :unprocessable_entity
        end
      end

      def update
        container = Container.find(params[:id])
        container.update_attributes(container_params)
        render json: container
      end

      def destroy
        container = Container.find(params[:id])
        container.destroy
        render json: container
      end

      private

      def container_params
        params.require(:container).permit(:containable_id, :containable_type)
      end

    end
  end
end
