class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.references :geometry, index: true
      t.references :vicinity, index: true

      t.timestamps null: false
    end
    add_foreign_key :locations, :geometries
    add_foreign_key :locations, :vicinities
  end
end
