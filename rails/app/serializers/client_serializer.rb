class ClientSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :name, :created_at, :updated_at

  has_many :client_links
end
