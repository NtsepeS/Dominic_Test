class PictureSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :mechanism, :date_taken, :created_at, :updated_at, :url, :width, :height

  has_one :album

  def url
    object.picture_data.url
  end
end
