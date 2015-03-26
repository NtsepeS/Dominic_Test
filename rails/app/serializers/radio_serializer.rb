class RadioSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :name, :item_code, :icasa_sticker

  has_one :client_link
end
