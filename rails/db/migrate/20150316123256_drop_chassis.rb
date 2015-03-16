class DropChassis < ActiveRecord::Migration
  def change
    drop_table :chassis
  end
end
