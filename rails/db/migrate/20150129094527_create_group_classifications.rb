class CreateGroupClassifications < ActiveRecord::Migration
  def change
    create_table :group_classifications do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
