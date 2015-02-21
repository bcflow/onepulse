class SentenceTag < ActiveRecord::Base
  belongs_to :sentence
  belongs_to :tag
end
