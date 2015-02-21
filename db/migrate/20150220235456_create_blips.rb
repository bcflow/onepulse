class CreateBlips < ActiveRecord::Migration
  def change
    create_table :blips do |t|
      t.string :body

      t.timestamps null: false
    end
  end
end
