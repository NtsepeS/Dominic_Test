class AlbumSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id

  has_many :pictures
end
