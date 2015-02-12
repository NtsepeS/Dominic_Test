class CreateControllerCards < ActiveRecord::Migration
  def change
    create_table :controller_cards do |t|

      t.timestamps null: false
    end
  end
end
