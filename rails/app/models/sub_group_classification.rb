class SubGroupClassification < ActiveRecord::Base
  belongs_to :group_classification
  has_many   :albums
end
