class ClientLinkSerializer < ApplicationSerializer
  attributes :id, :name, :branch, :circuit_number, :mac_address, :msad_number,
  :activation_date, :distance, :client, :status,
  :network_operator, :base_station_sector, :antenna, :created_at,
  :updated_at, :solution_identifier, :billing_account, :service_account, :service_account_site

  # lowercase_attribute :MAC_address

  embed :ids, include: true

  has_one :link_type
end
