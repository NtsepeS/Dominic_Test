class Picture < ActiveRecord::Base
  belongs_to :album
  mount_uploader :picture_data, PictureUploader
  before_save :update_picture_attributes, :use_exif_date
  after_create :use_created_at_date

  private

  def use_exif_date
    if picture_data.get_exif('DateTimeOriginal') != ""
      self.date_taken = Time.strptime(picture_data.get_exif('DateTimeOriginal'), '%Y:%m:%d %H:%M:%S')
    end
  end

  def use_created_at_date
    if !self.date_taken?
      self.date_taken = self.created_at
      self.save
    end
  end

  def update_picture_attributes
    self.width, self.height = `identify -format "%wx%h" #{picture_data.file.path}`.split(/x/)
  end

end
