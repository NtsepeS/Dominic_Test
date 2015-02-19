class RfPerformanceParameter < ActiveRecord::Base
  has_one :operating_parameter, as: :parameterized
end
