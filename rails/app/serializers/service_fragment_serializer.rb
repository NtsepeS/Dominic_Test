class ServiceFragmentSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :created_at, :updated_at, :work_order_number, :line_speed, :service_type, :physical_mode

  has_one :client_link
  has_many :services, include: true
end
