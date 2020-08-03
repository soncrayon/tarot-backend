# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
# Card.delete_all
# Reading.delete_all
# User.delete_all


# User.create({first_name:"Curtis", last_name:"Arnold"})

# 5.times do 
#     Reading.create([
#         {date:Date.today,
#     user_id:User.first.id}
#     ])
# end

# # need to be able to create readings without a user_id, at least for now 

# Card.create([
#     {card_img:"image", reading_id:Reading.first.id}, 
#     {card_img:"image", reading_id:Reading.second.id}, 
    
# ])


