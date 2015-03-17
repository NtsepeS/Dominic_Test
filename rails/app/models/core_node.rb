class CoreNode < ActiveRecord::Base
  has_paper_trail
  belongs_to :status
  belongs_to :city
  belongs_to :location
end
