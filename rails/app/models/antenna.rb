class Antenna < ActiveRecord::Base
  include LinkEquipment

  has_paper_trail

  belongs_to :location

  def to_name
    size
  end
end
