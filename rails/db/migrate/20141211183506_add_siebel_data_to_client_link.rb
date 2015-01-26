class AddSiebelDataToClientLink < ActiveRecord::Migration
  def change
    add_column :client_links, :solution_identifier, :string
    add_column :client_links, :billing_account, :string
    add_column :client_links, :service_account, :string
    add_column :client_links, :service_account_site, :string
  end
end
