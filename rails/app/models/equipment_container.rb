class EquipmentContainer < ActiveRecord::Base
  belongs_to :container
  belongs_to :equipment
end
