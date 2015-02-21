class CreateSentenceTags < ActiveRecord::Migration
  def change
    create_table :sentence_tags do |t|
      t.references :sentence, index: true
      t.references :tag, index: true

      t.timestamps null: false
    end
    add_foreign_key :sentence_tags, :sentences
    add_foreign_key :sentence_tags, :tags
  end
end
