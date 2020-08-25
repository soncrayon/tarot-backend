class ReadingSerializer < ActiveModel::Serializer
  attributes :id, :date_time_created
  has_many :cards
end

