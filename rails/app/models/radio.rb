class Radio < ActiveRecord::Base
  has_many :equipment, as: :equipped
end
