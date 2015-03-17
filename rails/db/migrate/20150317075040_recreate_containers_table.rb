class RecreateContainersTable < ActiveRecord::Migration
  def change
    create_table :containers do |t|
      t.integer :parent_id, null: true, index: true
      t.integer :lft, null: false, index: true
      t.integer :rgt, null: false, index: true
      t.references :containable, polymorphic: true, index: true
    end
  end
end
