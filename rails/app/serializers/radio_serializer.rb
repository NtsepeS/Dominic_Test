class RadioSerializer < ActiveModel::Serializer
  attributes :id, :name, :item_code, :icasa_sticker

  has_one :equipment
end
