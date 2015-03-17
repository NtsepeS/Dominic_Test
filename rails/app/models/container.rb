class Container < ActiveRecord::Base
  acts_as_nested_set

  belongs_to :containable, polymorphic: true
end
