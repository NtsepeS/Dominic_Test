class Radio < ActiveRecord::Base
  has_many :modulation
  has_many :rf_performance_parameter
end
