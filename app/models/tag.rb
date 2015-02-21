class Tag < ActiveRecord::Base

  has_many :sentence_tags, dependent: :destroy
  has_many :sentences, through: :sentence_tags

  validates :name, presence: true, uniqueness: true

end
