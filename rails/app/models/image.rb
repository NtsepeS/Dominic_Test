class Image < ActiveRecord::Base
  belongs_to :client_link
  mount_uploader :image_data, ImageUploader
end
