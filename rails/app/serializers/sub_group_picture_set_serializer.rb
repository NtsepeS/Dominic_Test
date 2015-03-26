class SubGroupPictureSetSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :album_id, :client_link_id, :created_at, :updated_at

  has_one :client_link
  has_one :sub_group_classification
  has_one :album
end
