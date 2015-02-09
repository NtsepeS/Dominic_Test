class PictureSerializer < ActiveModel::Serializer
  attributes :id, :mechanism, :picture_data, :date_taken,
    :album_id, :created_at, :updated_at
end
