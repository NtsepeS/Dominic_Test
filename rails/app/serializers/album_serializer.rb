class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :sub_group_classification_id, :client_link_id,
  :created_at, :updated_at

  has_many :pictures
end
