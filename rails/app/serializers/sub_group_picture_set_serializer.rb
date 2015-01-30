class SubGroupPictureSetSerializer < ActiveModel::Serializer
  attributes :id, :album_id, :sub_group_classification_id, :client_link_id,
    :created_at, :updated_at

  has_one :sub_group_classification, :album
end
