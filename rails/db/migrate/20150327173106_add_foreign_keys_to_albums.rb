class AddForeignKeysToAlbums < ActiveRecord::Migration
  def change

    change_table :albums do |t|
      t.references :sub_group_classification, index: true
      t.references :client_link, index: true
    end

    add_foreign_key :albums, :sub_group_classifications
    add_foreign_key :albums, :client_links
  end
end
