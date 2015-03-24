class ClientLinkSerializer < ActiveModel::Serializer
  attributes :id, :name, :branch, :circuit_number, :mac_address, :msad_number,
    :activation_date, :distance, :solution_identifier,
    :billing_account, :service_account, :service_account_site, :created_at,
    :updated_at

  has_one :client, :link_type, :network_operator, :status

  has_many :sub_group_picture_sets
end
