class CreateModulations < ActiveRecord::Migration
  def change
    create_table :modulations do |t|
      t.integer :downlink_min
      t.integer :downlink_max
      t.integer :uplink_min
      t.integer :uplink_max

      t.timestamps null: false
    end
  end
end
