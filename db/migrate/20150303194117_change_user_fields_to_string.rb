class ChangeUserFieldsToString < ActiveRecord::Migration
  def change
    change_column :users, :country, :string
    change_column :users, :city, :string

  end
end
