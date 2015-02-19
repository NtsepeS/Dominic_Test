module Api
  module V1
    class EquipmentController < AuthenticatedController

      def index
        equipment = Equipment.all
        render json: equipment
      end

      def show
        equipment = Equipment.find(params[:id])
        render json: equipment
      end

      def update
        equipment = Equipment.find(params[:id])
        equipment.update_attributes(equipment_params)
        render json: equipment
      end

      def destroy
        equipment = Equipment.find(params[:id])
        equipment.destroy
        render json: equipment
      end

      private

      def equipment_params
        params.fetch(:equipment, params).permit(
          :name,
          :is_asset_tag,
          :equipped_id,
          :equipped_type,
          :serial_number,
          :model_number,
          :product_number
        )
      end

    end
  end
end
