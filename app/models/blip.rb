class Blip < ActiveRecord::Base

  belongs_to :sentence

  validates :body, presence: true

  validates :body, length: {
    minimum: 1,
    maximum: 1,
    tokenizer: lambda { |str| str.split(/\s+/) },
    too_short: "must have at least %{count} word!",
    too_long: "You must input only %{count} word"
  }

end
