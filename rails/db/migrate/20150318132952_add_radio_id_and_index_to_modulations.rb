class AddRadioIdAndIndexToModulations < ActiveRecord::Migration
  def change
    add_column :modulations, :radio_id, :integer
    add_index :modulations, :radio_id
  end
end
