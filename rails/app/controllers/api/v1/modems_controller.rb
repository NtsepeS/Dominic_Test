module Api
  module V1
    class ModemsController < AuthenticatedController

      def index
        modems = Modem.all
        render json: modems
      end

      def show
        modem = Modem.find(params[:id])
        render json: modem
      end

      def update
        modem = Modem.find(params[:id])
        modem.update_attributes(modem_params)
        render json: modem
      end

      def destroy
        modem = Modem.find(params[:id])
        modem.destroy
        render json: modem
      end

      private

      def modem_params
        params.fetch(:modem, params).permit(:name)
      end

    end
  end
end
