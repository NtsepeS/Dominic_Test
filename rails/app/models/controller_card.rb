class ControllerCard < ActiveRecord::Base
  has_one :equipment, as: :equipped
end
