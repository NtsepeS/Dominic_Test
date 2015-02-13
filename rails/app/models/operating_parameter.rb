class OperatingParameter < ActiveRecord::Base
  belongs_to :location
  belongs_to :parameterized, polymorphic: true
end
