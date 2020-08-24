class CardSerializer < ActiveModel::Serializer
  attributes :id, :period, :name, :full_meaning, :upright_meaning, :reversed_meaning, :image, :orientation, :reading_id, :user_id 
  has_one :reading, optional: true 
  has_one :user, optional: true
end
