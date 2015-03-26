class ServiceFragment < ActiveRecord::Base
  has_many :services

  belongs_to :client_link
end
