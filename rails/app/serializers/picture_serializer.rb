class PictureSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :mechanism, :picture_data, :date_taken, :created_at, :updated_at

  has_one :album
end
