class CreateSubGroupPictureSets < ActiveRecord::Migration
  def change
    create_table :sub_group_picture_sets do |t|
      t.references :album, index: true
      t.references :sub_group_classification, index: true
      t.references :client_link, index: true

      t.timestamps null: false
    end
    add_foreign_key :sub_group_picture_sets, :albums
    add_foreign_key :sub_group_picture_sets, :sub_group_classifications
    add_foreign_key :sub_group_picture_sets, :client_links
  end
end
