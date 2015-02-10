class Location < ActiveRecord::Base
  belongs_to :geometry
  belongs_to :vicinity
end
