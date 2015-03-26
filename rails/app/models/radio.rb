class Radio < ActiveRecord::Base
  include LinkEquipment

  has_many :modulation
  has_many :rf_performance_parameter
end
