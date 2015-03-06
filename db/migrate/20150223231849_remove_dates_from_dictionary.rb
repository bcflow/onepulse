class RemoveDatesFromDictionary < ActiveRecord::Migration
  def change
    remove_column :dictionaries, :created_at, :datetime
        remove_column :dictionaries, :updated_at, :datetime

  end
end
