class CoreNode < ActiveRecord::Base
  has_paper_trail

  include Containable
  contains :base_station_units

  belongs_to :status
  belongs_to :city
  belongs_to :location

  def base_station_sectors
    base_station_units.map(&:base_station_sectors).flatten
  end

  def client_links
    base_station_sectors.map(&:client_links).flatten
  end
end
