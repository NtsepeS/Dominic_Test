class ClientLinkSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :name, :branch, :circuit_number, :mac_address, :msad_number,
    :activation_date, :distance, :solution_identifier,
    :billing_account, :service_account, :service_account_site, :created_at,
    :updated_at

  has_one :client
  has_one :link_type
  has_one :network_operator
  has_one :status
  has_one :antenna
  has_one :modem
  has_one :radio

  has_many :sub_group_picture_sets
  has_many :service_fragments
end
