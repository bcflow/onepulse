class AddBlipsUsers < ActiveRecord::Migration
  def change
       create_table :blips_users do |t|
      t.belongs_to :blip, index: true
      t.belongs_to :user, index: true
    end
  end
end
