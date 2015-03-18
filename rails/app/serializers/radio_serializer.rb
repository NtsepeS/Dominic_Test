class RadioSerializer < ActiveModel::Serializer
  attributes :id, :name, :item_code, :icasa_sticker

  has_many :modulation
  has_many :rf_performance_parameter
end
