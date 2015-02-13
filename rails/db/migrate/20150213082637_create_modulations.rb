class CreateModulations < ActiveRecord::Migration
  def change
    create_table :modulations do |t|
      t.number :downlink_min
      t.number :downlink_max
      t.number :uplink_min
      t.number :uplink_max

      t.timestamps null: false
    end
  end
end
