class SentenceSerializer < ActiveModel::Serializer
  attributes :body

  has_many :blips, dependent: :destroy
end
