class Card < ApplicationRecord
  belongs_to :reading, optional: true 
  belongs_to :user, optional: true 
end
