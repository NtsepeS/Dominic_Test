class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :services do |t|
      t.string :linetag
      t.decimal :line_speed
      t.text :vlan
      t.references :service_fragment, index: true
      t.timestamps
    end
  end

  def self.down
    drop_table :services
  end
end
