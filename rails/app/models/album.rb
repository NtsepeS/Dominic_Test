class Album < ActiveRecord::Base
  belongs_to :sub_group_classification
  belongs_to :client_link

  has_many :pictures
end
