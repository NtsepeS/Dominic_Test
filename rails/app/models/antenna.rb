class Antenna < ActiveRecord::Base
  has_paper_trail

  belongs_to :location
  has_one :equipment, as: :equipped
end
