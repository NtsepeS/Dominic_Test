class SubGroupPictureSet < ActiveRecord::Base
  belongs_to :album
  belongs_to :sub_group_classification
  belongs_to :client_link
end
