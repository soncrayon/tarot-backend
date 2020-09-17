class User < ApplicationRecord

    has_secure_password
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :password, presence: true 
    validates :email, presence: true
    validates :email, uniqueness: true

    has_many :cards 
    has_many :readings, through: :cards 

    @@users = User.all

  def User.digest(string)
    BCrypt::Password.create(string, cost: 20)
  end

  def self.suit_percentages_for_all_users
    suits = @@users.map { |user| 
      user.cards.map{ |card| 
        (card.name.include?("cups") || card.name.include?("pentacles") || card.name.include?("swords") || card.name.include?("wands")) ?  card.name.split("-")[-1] : "major_arcana" 
      }
    }.flatten
    suit_counts = suits.each_with_object(Hash.new(0)) { |suit,counts| counts[suit] += 1 }
    suit_counts.each { |suit, count| suit_counts[suit] = (count.to_f/suits.length * 100).round}
    suit_counts
  end

  def self.orientation_percentages_for_all_users
    orientations = @@users.map { |user| user.cards.map{ |card| card.orientation } }.flatten
    orientation_counts = orientations.each_with_object(Hash.new(0)) { |orientation,counts| counts[orientation] += 1 }
    orientation_counts.each { |orientation, count| orientation_counts[orientation] = (count.to_f/orientations.length * 100).round}
    orientation_counts
  end

  def suit_percentages_for_current_user
    suits = self.cards.map { |card| (card.name.include?("cups") || card.name.include?("pentacles") || card.name.include?("swords") || card.name.include?("wands")) ?  card.name.split("-")[-1] : "major_arcana" }
    suit_counts = suits.each_with_object(Hash.new(0)) { |suit,counts| counts[suit] += 1 }
    suit_counts.each { |suit, count| suit_counts[suit] = (count.to_f/suits.length * 100).round}
    suit_counts
  end

  def orientation_percentages_for_current_user
    orientations = self.cards.map{ |card| card.orientation }
    orientation_counts = orientations.each_with_object(Hash.new(0)) { |orientation,counts| counts[orientation] += 1 }
    orientation_counts.each { |orientation, count| orientation_counts[orientation] = (count.to_f/orientations.length * 100).round}
    orientation_counts
  end

end
