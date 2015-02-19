class Chassis < ActiveRecord::Base
  has_one :equipment, as: :equipped
  has_one :container, as: :containable
end
