class BaseStationSector < ActiveRecord::Base
  has_paper_trail

  has_one :container, as: :containable

  delegate :parent, :children, to: :container
  delegate :base_station_unit, to: :parent
  delegate :core_node, to: :base_station_unit

  belongs_to :status

  def client_links
    children.map(&:client_link)
  end
end
