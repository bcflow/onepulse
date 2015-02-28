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
  def word_total(id)
    Blip.where(sentence_id: id).count
  end

  def other_responses(id)
    self.group(:created_on).count
    #self.blips_count.to_f / 2
  end



   def blip_count(sentence_id, body)
    Blip.where(sentence_id: sentence_id, body: body).count
  end 


end
