class ClientLink < ActiveRecord::Base
  has_paper_trail ignore: [:created_at, :updated_at]

  belongs_to :client
  belongs_to :status
  belongs_to :network_operator
  belongs_to :link_type
  has_many   :service_fragment

  has_many :sub_group_picture_sets
end
