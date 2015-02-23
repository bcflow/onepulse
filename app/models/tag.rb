class Tag < ActiveRecord::Base

  #RELATIONS
  has_and_belongs_to_many :sentences


  #VALIDATIONS
  validates :name, presence: true, uniqueness: true

end
