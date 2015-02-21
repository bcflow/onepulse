class RemoveTriggerFromSentences < ActiveRecord::Migration
  def change
    remove_column :sentences, :trigger, :string
  end
end
