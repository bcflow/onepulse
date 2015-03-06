class AddTagsSentencesJoin < ActiveRecord::Migration
  def change
    create_table :sentences_tags do |t|
      t.integer :sentence_id
      t.integer :tag_id
    end
  end
end
