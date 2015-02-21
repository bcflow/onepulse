class Blip < ActiveRecord::Base

  belongs_to :sentence
  
  validates :body, presence: true

end
