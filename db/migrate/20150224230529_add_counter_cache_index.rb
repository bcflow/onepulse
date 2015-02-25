class AddCounterCacheIndex < ActiveRecord::Migration
  def change
    add_index :sentences, :blips_count
  end
end
