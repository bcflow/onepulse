class RemoveTagTable < ActiveRecord::Migration
  def change
    drop_table :sentence_tags
  end
end
