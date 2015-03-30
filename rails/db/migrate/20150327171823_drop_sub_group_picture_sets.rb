class DropSubGroupPictureSets < ActiveRecord::Migration
  def change
     drop_table :sub_group_picture_sets
  end
end
