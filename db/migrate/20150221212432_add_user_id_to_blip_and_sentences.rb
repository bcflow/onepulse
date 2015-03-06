class AddUserIdToBlipAndSentences < ActiveRecord::Migration
  def change
    add_column :blips, :user_id, :integer
    add_column :sentences, :user_id, :integer
  end
end
