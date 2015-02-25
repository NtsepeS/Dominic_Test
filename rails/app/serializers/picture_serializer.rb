class PictureSerializer < ActiveModel::Serializer
  attributes :id, :mechanism, :date_taken,
    :album_id, :created_at, :updated_at, :url

  def url
    object.picture_data.url
  end

end
