class SubGroupPictureSetSerializer < ActiveModel::Serializer
  attributes :id, :album, :sub_group_classification, :client_link,
    :created_at, :updated_at
end
