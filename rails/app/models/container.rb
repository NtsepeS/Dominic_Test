class Container < ActiveRecord::Base
  belongs_to :containable, polymorphic: true

  has_many :equipment_containers
  has_many :equipment, through: :equipment_containers
end
