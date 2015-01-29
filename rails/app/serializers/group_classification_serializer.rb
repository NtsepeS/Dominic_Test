class GroupClassificationSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :updated_at

  has_many :sub_group_classifications
end
