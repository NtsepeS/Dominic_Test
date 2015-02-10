class CreateVicinities < ActiveRecord::Migration
  def change
    create_table :vicinities do |t|
      t.text :physical_address

      t.timestamps null: false
    end
  end
end
