class RadioSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :name, :item_code, :icasa_sticker

  has_one :client_link
  has_many :modulations
  has_many :rf_performance_parameters
end
