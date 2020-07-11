class UserSerializer < ActiveModel::Serializer
  attributes :id
  has_many :readings
  has_many :cards, through: :readings
end
