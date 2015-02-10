class Equipment < ActiveRecord::Base
  belongs_to :equipable, polymorphic: true
end
