class Antenna < ActiveRecord::Base
  has_paper_trail

  belongs_to :location

  def to_name
    size
  end
end
