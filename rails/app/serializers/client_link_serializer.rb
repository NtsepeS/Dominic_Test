class ClientLinkSerializer < ActiveModel::Serializer
  attributes :id, :name, :branch, :circuit_number, :mac_address,
    :msad_number, :activation_date, :distance, :client, :status,
    :network_operator, :base_station_sector, :antenna, :solution_identifier,
    :billing_account, :service_account, :service_account_site, :created_at, :updated_at

  embed :ids, include: true

  has_one :link_type
end
