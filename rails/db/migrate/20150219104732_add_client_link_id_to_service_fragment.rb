class AddClientLinkIdToServiceFragment < ActiveRecord::Migration
  def change
    add_column :service_fragments, :client_link_id, :integer
  end
end
