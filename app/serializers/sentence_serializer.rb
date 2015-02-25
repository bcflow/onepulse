class SentenceSerializer < ActiveModel::Serializer
  attributes :id, :body

  has_many :blips, dependent: :destroy

end
