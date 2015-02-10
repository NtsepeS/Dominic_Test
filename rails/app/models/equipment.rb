class Equipment < ActiveRecord::Base
  belongs_to :equipped, polymorphic: true
end
