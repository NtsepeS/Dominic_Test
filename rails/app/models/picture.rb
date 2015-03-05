class Picture < ActiveRecord::Base
  belongs_to :album
  mount_uploader :picture_data, PictureUploader
  before_save :update_picture_attributes

  private

  def update_picture_attributes
    self.width, self.height = `identify -format "%wx%h" #{picture_data.file.path}`.split(/x/)
  end

end
