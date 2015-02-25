class AddCounterCacheToSentences < ActiveRecord::Migration
  def change
    add_column :sentences, :blips_count, :integer
    remove_column :sentences, :user_id, :integer
  end
end
