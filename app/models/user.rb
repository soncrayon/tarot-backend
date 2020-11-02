class User < ApplicationRecord
    
    has_secure_password
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :password, presence: true, allow_blank: true 
    validates :email, presence: true
    validates :email, uniqueness: true

    has_many :readings, dependent: :destroy
    has_many :cards, through: :readings 

    @@users = User.all

  def User.digest(string)
    BCrypt::Password.create(string, cost: 20)
  end

  def self.arcana_percentages_for_all_users

    arcanas = @@users.map { |user| 
      user.cards.map{ |card| 
        (card.name.include?("cups") || 
        card.name.include?("pentacles") || 
        card.name.include?("swords") || 
        card.name.include?("wands")) ?  card.name.split("-")[-1] : "major_arcana" 
      }
    }.flatten
    
    arcana_counts = arcanas.each_with_object(Hash.new(0)) { |arcana,counts| counts[arcana] += 1 }
    arcana_counts.each { |arcana, count| arcana_counts[arcana] = (count.to_f/arcanas.length * 100).round}
    arcana_counts
  end

  def self.orientation_percentages_for_all_users
    orientations = @@users.map { |user| user.cards.map{ |card| card.orientation } }.flatten
    orientation_counts = orientations.each_with_object(Hash.new(0)) { |orientation,counts| counts[orientation] += 1 }
    orientation_counts.each { |orientation, count| orientation_counts[orientation] = (count.to_f/orientations.length * 100).round}
    orientation_counts
  end

  def self.highest_arcana_percentage_for_all_users
    self.arcana_percentages_for_all_users.max_by{ |arcana, count| count }[0]
  end

  def self.highest_orientation_percentage_for_all_users
    self.orientation_percentages_for_all_users.max_by{ |orientation, count| count }[0]
  end

  def arcana_percentages_for_current_user

    arcanas = self.cards.map { |card| (card.name.include?("cups") || 
    card.name.include?("pentacles") || 
    card.name.include?("swords") || 
    card.name.include?("wands")) ?  card.name.split("-")[-1] : "major_arcana" }

    arcana_counts = arcanas.each_with_object(Hash.new(0)) { |arcana,counts| counts[arcana] += 1 }
    arcana_counts.each { |arcana, count| arcana_counts[arcana] = (count.to_f/arcanas.length * 100).round}
    arcana_counts
  end

  def orientation_percentages_for_current_user
    orientations = self.cards.map{ |card| card.orientation }
    orientation_counts = orientations.each_with_object(Hash.new(0)) { |orientation,counts| counts[orientation] += 1 }
    orientation_counts.each { |orientation, count| orientation_counts[orientation] = (count.to_f/orientations.length * 100).round}
    orientation_counts
  end

  def highest_arcana_percentage_for_current_user
    arcana_percentages_for_current_user.max_by{ |arcana, count| count }[0]
  end

  def highest_orientation_percentage_for_current_user
    orientation_percentages_for_current_user.max_by{ |orientation, count| count }[0]
  end

end
