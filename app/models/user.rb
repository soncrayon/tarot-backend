class User < ApplicationRecord
    has_many :readings
    has_many :cards, through: :readings 
end
