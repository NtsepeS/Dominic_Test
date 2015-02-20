class Service < ActiveRecord::Base
  belongs_to :service_fragment
  has_many :port
end
