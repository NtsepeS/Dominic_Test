class CreateOperatingParameters < ActiveRecord::Migration
  def change
    create_table :operating_parameters do |t|
      t.references :location, index: true
      t.references :params, polymorphic: true, index: true

      t.timestamps null: false
    end
    add_foreign_key :operating_parameters, :locations
  end
end
