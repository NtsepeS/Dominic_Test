class AddRadioIdToClientLink < ActiveRecord::Migration
  def change
    add_column :client_links, :radio_id, :integer
  end
end
