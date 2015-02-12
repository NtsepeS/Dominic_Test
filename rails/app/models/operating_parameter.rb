class OperatingParameter < ActiveRecord::Base
  belongs_to :location
  belongs_to :params, polymorphic: true
end
