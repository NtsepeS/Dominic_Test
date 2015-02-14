class RenameDataToImageData < ActiveRecord::Migration
  def change
    rename_column :images, :data, :image_data
  end
end
