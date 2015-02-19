class AddPolymorphicAssocToContainer < ActiveRecord::Migration
  def change
    add_reference :containers, :containable, polymorphic: true, index: true
  end
end
