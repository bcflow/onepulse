class Sentence < ActiveRecord::Base

  #BLIPS RELATION
  has_many :blips, dependent: :destroy

  #TAGS RELATION
  has_many :sentence_tags, dependent: :destroy
  has_many :tags, through: :sentence_tags

  #VALIDATIONS
  validates :body, presence: true
  validates :body, uniqueness: true




end
