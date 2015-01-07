class CoreNode < ActiveRecord::Base
  has_paper_trail
  belongs_to :status
  belongs_to :city
  has_many :base_station_units
end
