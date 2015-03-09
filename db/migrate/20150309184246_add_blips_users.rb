class AddBlipsUsers < ActiveRecord::Migration
  def change
    create_table :blips_users, force: :cascade do |t|
    t.integer :user_id
    t.integer :blip_id
    end
  end
end
