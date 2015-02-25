class Album < ActiveRecord::Base
  has_many :pictures
  has_one :sub_group_picture_set
end
