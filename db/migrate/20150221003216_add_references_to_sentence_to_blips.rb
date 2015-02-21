class AddReferencesToSentenceToBlips < ActiveRecord::Migration
  def change
    add_reference :blips, :sentence, index: true
  end
end
