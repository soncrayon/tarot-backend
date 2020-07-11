class CardSerializer < ActiveModel::Serializer
  attributes :id, :name, :summary, :full_meaning, :upright, :reversed, :image
  has_one :reading
end
