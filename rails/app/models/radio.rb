class Radio < ActiveRecord::Base
  has_one :equipment, as: :equipped
end
