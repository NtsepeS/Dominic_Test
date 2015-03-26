class ModemSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :name

  has_one :client_link
end
