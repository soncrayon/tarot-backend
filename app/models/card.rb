class Card < ApplicationRecord
  belongs_to :reading, optional: true
end
