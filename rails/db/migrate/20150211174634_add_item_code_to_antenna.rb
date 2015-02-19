class AddItemCodeToAntenna < ActiveRecord::Migration
  def change
    add_column :antennas, :item_code, :string
  end
end
