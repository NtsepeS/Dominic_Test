class CreateServiceFragments < ActiveRecord::Migration
  def self.up
    create_table :service_fragments do |t|
      t.string :work_order_number
      t.decimal :line_speed
      t.string :service_type
      t.string :physical_mode
      t.timestamps
    end
  end

  def self.down
    drop_table :service_fragments
  end
end
