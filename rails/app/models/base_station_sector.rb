class BaseStationSector < ActiveRecord::Base
  has_paper_trail
  belongs_to :status
  has_many :client_links
end
