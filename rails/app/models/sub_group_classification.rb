class SubGroupClassification < ActiveRecord::Base
  belongs_to :group_classification
  has_many   :sub_group_picture_sets
end
