class AddIndexToRadioIdToClientLinks < ActiveRecord::Migration
  def change
    add_index :client_links, :radio_id
  end
end
