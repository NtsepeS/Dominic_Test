class EquipmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :is_asset_tag, :equipped_id, :equipped_type,
    :serial_number, :model_number, :product_number
end
