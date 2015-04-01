class CreateModulations < ActiveRecord::Migration
  def change
    drop_table 'modulations' if ActiveRecord::Base.connection.table_exists? 'modulations'

    create_table :modulations do |t|
      t.string :downlink_min
      t.string :downlink_max
      t.string :uplink_min
      t.string :uplink_max

      t.timestamps null: false
    end
  end
end
