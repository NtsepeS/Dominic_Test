class BaseStationSector < ActiveRecord::Base
  has_paper_trail
  belongs_to :status
end
