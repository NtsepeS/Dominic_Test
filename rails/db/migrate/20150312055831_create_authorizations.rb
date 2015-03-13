class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.string :email, null: false
      t.string :name, null: false
      t.string :invited_by, null: false

      t.string :invite_id
      t.string :role, null: false

      t.timestamps null: false
    end
  end
end
