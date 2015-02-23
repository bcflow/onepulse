class RemoveUserFromBlips < ActiveRecord::Migration
  def change
    remove_column :blips, :user_id, :integer
  end
end
