class BaseStationSector < ActiveRecord::Base
  has_paper_trail

  has_one :container, as: :containable

  belongs_to :status
end
