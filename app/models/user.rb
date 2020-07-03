class User < ApplicationRecord
    has_many :readings
    has_many :cards, through: :readings 
    validates :first_name, presence: true
    validates :last_name, presence: true 
end
