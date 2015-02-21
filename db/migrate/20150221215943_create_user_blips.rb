class CreateUserBlips < ActiveRecord::Migration
  def change
    create_table :user_blips do |t|
      t.references :user, index: true
      t.references :blip, index: true

      t.timestamps null: false
    end
    add_foreign_key :user_blips, :users
    add_foreign_key :user_blips, :blips
  end
end
