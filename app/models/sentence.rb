class Sentence < ActiveRecord::Base

  #BLIPS RELATION
  has_many :blips, dependent: :destroy

  #TAGS RELATION
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags, allow_destroy: true

  #VALIDATIONS
  validates :body, presence: true
  validates :body, uniqueness: true


  #return total blips of this perticular body for this sentence
  def word_total
    Blip.where(sentence_id: sentence_id, body: body)
  end


end
