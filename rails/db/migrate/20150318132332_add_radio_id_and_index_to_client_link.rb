class AddRadioIdAndIndexToClientLink < ActiveRecord::Migration
  def change
    add_column :client_links, :radio_id, :integer
    add_index :client_links, :radio_id
  end
end
