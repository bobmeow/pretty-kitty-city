# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
User.create(username: "bob", name: "bob", password: '123')
Pet.create(name: "a cat", owner_id: User.all.last.id)
User.create(username: "dude", name: "dude", password: '123')
Pet.create(name: "cattt", owner_id: User.all.last.id)
User.create(username: "person", name: "person", password: '123')
Pet.create(name: "mor catt", owner_id: User.all.last.id)

Pet.all.last.people_friends << User.find(2)
Pet.all.second.people_friends << User.find(1)
Pet.all.first.people_friends << User.find(2)

# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
