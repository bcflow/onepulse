class Tag < ActiveRecord::Base

  has_many :tags, dependent: :destroy
  has_many :sentences, through: :sentence_tag

  validates :name, present: true, uniqueness: true

end
