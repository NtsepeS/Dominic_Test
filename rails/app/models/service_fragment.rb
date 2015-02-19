class ServiceFragment < ActiveRecord::Base
  has_many :service
  belongs_to :client_link
end
