class Blip < ActiveRecord::Base

  validate :word_is_valid

  belongs_to :sentence

  #Users Relation
  has_many :users, through: :user_blips
  has_many :user_blips, dependent: :nullify




  validates :body, presence: true

  #Checks word count
  validates :body, length: {
    minimum: 1,
    maximum: 1,
    tokenizer: lambda { |str| str.split(/\s+/) },
    too_short: "must have at least %{count} word!",
    too_long: "You must input only %{count} word"
  }

  #Checks that blip is letters only
  validates_format_of :body, :with => /\A[a-zA-Z]+\z/

  private

  def word_is_valid
  errors.add(:blip, "isn't valid") if Dictionary.where(blip: word).blank?
  end

end
