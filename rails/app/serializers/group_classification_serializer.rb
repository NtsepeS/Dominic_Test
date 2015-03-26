class GroupClassificationSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :name, :created_at, :updated_at

  has_many :sub_group_classifications
end
