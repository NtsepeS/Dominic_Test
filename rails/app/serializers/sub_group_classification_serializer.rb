class SubGroupClassificationSerializer < ActiveModel::Serializer
  attributes :id, :name, :group_classification_id, :created_at, :updated_at

  has_many :albums
end
