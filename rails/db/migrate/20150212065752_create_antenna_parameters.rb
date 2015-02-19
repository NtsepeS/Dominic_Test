class CreateAntennaParameters < ActiveRecord::Migration
  def change
    create_table :antenna_parameters do |t|
      t.string :polarization

      t.timestamps null: false
    end
  end
end
