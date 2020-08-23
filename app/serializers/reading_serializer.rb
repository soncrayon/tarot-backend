class ReadingSerializer < ActiveModel::Serializer
  attributes :id, :created_at
  has_many :cards
end

