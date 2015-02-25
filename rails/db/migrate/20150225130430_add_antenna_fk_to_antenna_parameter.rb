class AddAntennaFkToAntennaParameter < ActiveRecord::Migration
  def change
    add_reference :antenna_parameters, :antenna, index: true
    add_foreign_key :antenna_parameters, :antennas
  end
end
