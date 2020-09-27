class Reading < ApplicationRecord
  has_many :cards, dependent: :destroy 
  belongs_to :user, optional: true 
end
