class CreatePorts < ActiveRecord::Migration
  def self.up
    create_table :ports do |t|
      t.string :vlan_type
      t.string :acceptable_frame_type
      t.string :default_vlan
      t.references :service
      t.timestamps
    end
  end

  def self.down
    drop_table :ports
  end
end
