class CreateChassis < ActiveRecord::Migration
  def change
    create_table :chassis do |t|

      t.timestamps null: false
    end
  end
end
