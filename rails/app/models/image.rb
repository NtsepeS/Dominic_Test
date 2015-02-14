class Image < ActiveRecord::Base
  belongs_to :client_link
  mount_uploader :data, ImageUploader
end
