class Blip < ActiveRecord::Base

  belongs_to :sentence
  
  has_many :users, through: :user_blips
  has_many :user_blips, dependent: :destroy

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


end
