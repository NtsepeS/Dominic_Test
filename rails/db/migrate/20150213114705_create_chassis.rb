class CreateChasses < ActiveRecord::Migration
  def change
    create_table :chasses do |t|

      t.timestamps null: false
    end
  end
end
