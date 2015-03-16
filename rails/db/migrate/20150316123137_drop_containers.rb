class DropContainers < ActiveRecord::Migration
  def change
    drop_table :containers
  end
end
