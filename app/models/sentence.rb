class Sentence < ActiveRecord::Base

  #BLIPS RELATION
  has_many :blips, dependent: :destroy

  #TAGS RELATION
  has_and_belongs_to_many :tags

  #VALIDATIONS
  validates :body, presence: true
  validates :body, uniqueness: true




end
