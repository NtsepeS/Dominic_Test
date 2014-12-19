class CreateNetworkOperators < ActiveRecord::Migration
  def change
    create_table :network_operators do |t|
      t.string :name

      t.timestamps
    end
  end
end
