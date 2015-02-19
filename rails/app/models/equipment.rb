class Equipment < ActiveRecord::Base
  belongs_to :equipped, polymorphic: true

  has_many :equipment_containers
  has_many :containers, through: :equipment_containers
end
