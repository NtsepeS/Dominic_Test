module Api
  module V1
    class RadiosController < AuthenticatedController

      def index
        radios = Radio.all
        render json: radios
      end

      def show
        radio = Radio.find(params[:id])
        render json: radio
      end

      def create
        radio =  Radio.new(radio_params)
        if radio.save
          render json: radio, status: :created
        else
          render json: radio.errors.to_json, status: :unprocessable_entity
        end
      end

      def update
        radio = Radio.find(params[:id])
        radio.update_attributes(radio_params)
        render json: radio
      end

      def destroy
        radio = Radio.find(params[:id])
        radio.destroy
        render json: radio
      end

      private

      def radio_params
        params.fetch(:radio, params).permit(:name, :item_code, :icasa_sticker)
      end

    end
  end
end
