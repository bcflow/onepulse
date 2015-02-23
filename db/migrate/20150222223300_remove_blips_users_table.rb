class RemoveBlipsUsersTable < ActiveRecord::Migration
  def change
    drop_table :blips_users
  end
end
