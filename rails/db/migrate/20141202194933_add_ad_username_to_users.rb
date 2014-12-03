class AddAdUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ad_username, :string
  end
end
