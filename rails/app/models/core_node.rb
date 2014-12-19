class CoreNode < ActiveRecord::Base
  belongs_to :status
  belongs_to :city
  has_many :base_station_units
end
