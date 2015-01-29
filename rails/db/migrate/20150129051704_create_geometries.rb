class CreateGeometries < ActiveRecord::Migration
  def change
    create_table :geometries do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.decimal :altitude

      t.timestamps null: false
    end
  end
end
