class AddClientLinkRefsToImages < ActiveRecord::Migration
  def change
    add_reference :images, :client_link, index: true
  end
end

