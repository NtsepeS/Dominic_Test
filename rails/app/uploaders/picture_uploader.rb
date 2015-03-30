class PictureUploader < CarrierWave::Uploader::Base
 include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Get the exif data from the uploaded file
  def get_exif( name )
    manipulate! do |img|
      return img["EXIF:" + name]
    end
  end

end
