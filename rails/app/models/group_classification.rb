class GroupClassification < ActiveRecord::Base
  has_many :sub_group_classifications
end
