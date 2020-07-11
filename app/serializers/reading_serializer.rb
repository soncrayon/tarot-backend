class ReadingSerializer < ActiveModel::Serializer
  attributes :id
  has_many :cards
end
