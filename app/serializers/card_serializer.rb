class CardSerializer < ActiveModel::Serializer
  attributes :id, :card_name, :card_full_meaning, :card_upright, :card_reversed, :card_image, :card_orientation, :period
  has_one :reading, optional: true 
end
