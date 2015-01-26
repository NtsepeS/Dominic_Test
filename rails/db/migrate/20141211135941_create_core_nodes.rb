class CreateCoreNodes < ActiveRecord::Migration
  def change
    create_table :core_nodes do |t|
      t.string :name
      t.references :status, index: true
      t.references :city, index: true
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
