module Api
  module V1
    class ControllerCardsController < AuthenticatedController

      def index
        controller_cards = ControllerCard.all
        render json: controller_cards
      end

      def show
        controller_card = ControllerCard.find(params[:id])
        render json: controller_card
      end

      def update
        controller_card = ControllerCard.find(params[:id])
        controller_card.update_attributes(controller_card_params)
        render json: controller_card
      end

      def destroy
        controller_card = ControllerCard.find(params[:id])
        controller_card.destroy
        render json: controller_card
      end

      private

      def controller_card_params
        params.require(:controller_card).permit(:name)
      end

    end
  end
end
