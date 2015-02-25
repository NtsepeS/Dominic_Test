class AntennaParameter < ActiveRecord::Base
  has_one :operating_parameter, as: :parameterized
  belongs_to :antenna
end
