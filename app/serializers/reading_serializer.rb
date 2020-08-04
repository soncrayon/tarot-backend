class ReadingSerializer < ActiveModel::Serializer
  attributes :id, :date
  has_many :cards
end

