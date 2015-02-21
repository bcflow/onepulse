class Sentence < ActiveRecord::Base

  has_many :blips, dependent: :destroy

  validates :body, presence: true
  validates :body, uniqueness: true

  has_many :sentence_tags, dependent: :destroy 
  has_many :tags, through: :sentence_tags

  
end
