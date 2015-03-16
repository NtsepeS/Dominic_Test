class RemoveAntennaRefFromClientLink < ActiveRecord::Migration
  def change
    remove_reference :client_links, :antenna, index: true
  end
end
