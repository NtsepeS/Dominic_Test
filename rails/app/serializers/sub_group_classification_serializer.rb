class SubGroupClassificationSerializer < ActiveModel::Serializer
  attributes :id, :name, :group_classification_id, :created_at, :updated_at

  has_many :sub_group_picture_sets
end
