class BaseStationUnit < ActiveRecord::Base
  has_paper_trail

  has_one :container, as: :containable

  delegate :parent, :children, to: :container
  delegate :core_node, to: :parent

  belongs_to :status

  def base_station_sectors
    children.map(&:base_station_sector)
  end
end
