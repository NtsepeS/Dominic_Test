class CreateModems < ActiveRecord::Migration
  def change
    create_table :modems do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
