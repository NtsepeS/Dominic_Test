class Radio < ActiveRecord::Base
  include LinkEquipment

  has_many :modulations
  has_many :rf_performance_parameters
end
