class AddCountToBlip < ActiveRecord::Migration
  def change
    add_column :blips, :count, :integer
  end
end
