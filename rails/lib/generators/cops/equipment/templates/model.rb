class <%= class_name %> < ActiveRecord::Base
  has_one :equipment, as: :equipped
end
