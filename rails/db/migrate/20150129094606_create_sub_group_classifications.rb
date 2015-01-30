class CreateSubGroupClassifications < ActiveRecord::Migration
  def change
    create_table :sub_group_classifications do |t|
      t.string :name
      t.references :group_classification, index: true

      t.timestamps null: false
    end
    add_foreign_key :sub_group_classifications, :group_classifications
  end
end
