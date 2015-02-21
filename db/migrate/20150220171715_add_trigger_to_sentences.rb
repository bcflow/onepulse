class AddTriggerToSentences < ActiveRecord::Migration
  def change
    add_column :sentences, :trigger, :string
  end
end
