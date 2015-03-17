class CoreNode < ActiveRecord::Base
  has_paper_trail

  has_one :container, as: :containable

  belongs_to :status
  belongs_to :city
  belongs_to :location
end
