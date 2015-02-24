class Blip < ActiveRecord::Base

  #RELATIONS

  belongs_to              :sentence
  has_and_belongs_to_many :users

  before_save { |blip| blip.body = blip.body.downcase.strip }
  #scope :blip_answered,  

  
  #VALIDATIONS

  validate            :word_is_valid
  validates           :body, presence: true
  validates           :body, length: { maximum: 25 }
  validates_format_of :body, :with => /\A[^\W_]+\z/
  validates           :body, length: {
                        minimum: 1,
                        maximum: 1,
                        tokenizer: lambda { |str| str.split(/\s+/) },
                        too_short: "You must have at least one word!",
                        too_long: "You must input only one word"
                        }

  private

  def word_is_valid
     errors.add(:body, "is not an english word") if Dictionary.where(word: body).blank?
  end


end
