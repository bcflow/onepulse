class SentenceSerializer < ActiveModel::Serializer
  attributes :id, :body, :answered

  has_many :blips, dependent: :destroy

  def answered
    false
  end
end
