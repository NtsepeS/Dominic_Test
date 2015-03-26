class SubGroupClassificationSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :name, :created_at, :updated_at

  has_one :group_classification
  has_many :sub_group_picture_sets
end
