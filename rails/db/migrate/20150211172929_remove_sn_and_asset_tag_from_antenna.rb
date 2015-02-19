class RemoveSnAndAssetTagFromAntenna < ActiveRecord::Migration
  def change
    remove_column :antennas, :serial_number, :integer
    remove_column :antennas, :is_asset_tag, :integer
  end
end
