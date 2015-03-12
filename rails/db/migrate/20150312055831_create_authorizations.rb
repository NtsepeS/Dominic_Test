class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.string :email
      t.string :princaple_id
      t.string :invite_id

      t.timestamps null: false
    end
  end
end
