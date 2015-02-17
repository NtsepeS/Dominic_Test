class ImageSerializer < ActiveModel::Serializer
  attributes :id, :client_link_id, :created_at, :updated_at, :url

  def url
    object.image_data.url
  end
end
