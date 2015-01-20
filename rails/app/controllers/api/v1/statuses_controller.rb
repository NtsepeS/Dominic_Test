module Api
  module V1
    class StatusesController < AuthenticatedController

      def index
        status = Status.all
        render json: status
      end

      def show
        status = Status.find(params[:id])
        render json: status
      end

      def update
        status = Status.find(params[:id])
        status.update_attributes(status_params)
        render json: status
      end

      def destroy
        status = Status.find(params[:id])
        status.destroy
        render json: status
      end

      private

      def status_params
        params.fetch(:status, params).permit(:name)
      end

    end
  end
end