class Container < ActiveRecord::Base
  belongs_to :containable, polymorphic: true
end
