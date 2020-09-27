class ReadingSerializer < ActiveModel::Serializer
  attributes :id, :date_time_created, :user_id
  has_many :cards
end

