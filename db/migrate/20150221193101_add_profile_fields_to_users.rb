class AddProfileFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :country, :text
    add_column :users, :age, :integer
    add_column :users, :gender, :text
    add_column :users, :city, :text

  end
end
