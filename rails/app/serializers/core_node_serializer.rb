class CoreNodeSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :name, :created_at, :updated_at

  has_one :city
  has_one :location
  has_one :status
  has_many :base_station_units
end
