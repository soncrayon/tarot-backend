class User < ApplicationRecord

    has_secure_password
    validates :email, presence: true
    validates :email, uniqueness: true

    has_many :cards 
    has_many :readings, through: :cards 

    # Returns the hash digest of the given string. For the seed data. Remove at end of testing. 
def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  

end
