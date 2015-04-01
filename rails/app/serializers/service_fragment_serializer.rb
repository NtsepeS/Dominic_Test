class ServiceFragmentSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :updated_at, :work_order_number, :line_speed, :service_type, :physical_mode

  has_many :service
end
