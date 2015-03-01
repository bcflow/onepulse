class SentenceSerializer < ActiveModel::Serializer
  attributes :id, :body, :answered, :dismissed

  has_many :blips, dependent: :destroy

  def answered
    false
  end

  def dismissed 
    false
  end

end
