class CardSerializer < ActiveModel::Serializer
  attributes :id, :period, :name, :full_meaning, :upright_meaning, :reversed_meaning, :image, :orientation, :reading_id
  belongs_to :reading, optional: true 
end
