# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Card.delete_all
Reading.delete_all
User.delete_all


User.create({first_name:"Curtis", last_name:"Arnold"})

5.times do 
    Reading.create([
        {date:Date.today,
    user_id:User.first.id}
    ])
end

Card.create([
    {title:"card", image:"image", description:"Here's a description", reading_id:Reading.first.id}, 
    {title:"card", image:"image", description:"Here's a description", reading_id:Reading.second.id}, 
    {title:"card", image:"image", description:"Here's a description", reading_id:Reading.third.id}, 
    {title:"card", image:"image", description:"Here's a description", reading_id:Reading.third.id}, 
    {title:"card", image:"image", description:"Here's a description", reading_id:Reading.fourth.id}, 
    {title:"card", image:"image", description:"Here's a description", reading_id:Reading.last.id}, 
    {title:"card", image:"image", description:"Here's a description", reading_id:Reading.last.id}
])


