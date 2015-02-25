class SubGroupClassification < ActiveRecord::Base
  belongs_to :group_classification
  has_one :sub_group_picture_set
end
