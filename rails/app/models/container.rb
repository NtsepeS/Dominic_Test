class Container < ActiveRecord::Base
  has_many :equipment_containers
  has_many :equipment, through: :equipment_containers
end
