class RfPerformanceParameter < ActiveRecord::Base
  has_one :operating_parameter, as: :params
end
