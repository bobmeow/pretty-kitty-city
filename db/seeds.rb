###User seeds
User.create(username: "jmpann", name: "Josh", password: '123')
User.create(username: "rachlovescats", name: "Rachel", password: '123')
User.create(username: "kk_antoin", name: "Antoin", password: '123')
User.create(username: "jj", name: "Jing", password: '123')
User.create(username: "bobmeow", name: "Bob", password: '123')
User.create(username: 'icandy', name: "Ian", password: '123')
User.create(username: 'fitnessguru', name: "Yomi", password: '123')
User.create(username: 'a', name: 'a', password: 'a')

###Pet seeds
rufus = Pet.create(name: "Rufus", mood_level: 5, owner_id: 1)
benecc = Pet.create(name: "Benedict CumberCat", mood_level: 5, owner_id: 2)
tiger = Pet.create(name: "Tiger", mood_level: 5, owner_id: 3)
kitty_purry = Pet.create(name: "Kitty Purry", mood_level: 5, owner_id: 4)
coffee_cat = Pet.create(name: "Coffee Cat", mood_level: 5, owner_id: 5)
scary_spice = Pet.create(name: "Scary Spice Baby Kat", mood_level: 5, owner_id: 6)
cheddar_cat = Pet.create(name: "Cheddar Cat", mood_level: 5, owner_id: 7)
cat_man = Pet.create(name: "the cat man", mood_level: 5, owner_id: 8)

###Seeding Friends of Cats
rufus.people_friends << [User.find(2), User.find(3), User.find(4)]
benecc.people_friends << [User.find(3), User.find(6)]
tiger.people_friends << [User.find(1), User.find(4)]
kitty_purry.people_friends << [User.find(2), User.find(7)]
coffee_cat.people_friends << [User.find(2), User.find(3), User.find(4), User.find(6), User.find(7)]
scary_spice.people_friends << [User.find(2), User.find(1)]
cheddar_cat.people_friends << [User.find(5), User.find(3), User.find(6)]

###Seeding items
Item.create(name: "Crown", emoji: "👑", price: 100)
Item.create(name: "Top Hat", emoji: "🎩", price: 10)
Item.create(name: "Bikini", emoji: "👙", price: 1000)
Item.create(name: "Pizza", emoji: "🍕", price: 1)
Item.create(name: "Treat", emoji: "🎾", price: 4)
Item.create(name: "Shrimp", emoji: "🍤", price: 5)
Item.create(name: "Sushi", emoji: "🍣", price: 10)
Item.create(name: "Toy Mouse", emoji: "🐭", price: 12)
Item.create(name: "Martini", emoji: "🍸", price: 25)
Item.create(name: "Iphone", emoji: "📱", price: 200)
Item.create(name: "Box", emoji: "📥", price: 30)
Item.create(name: "Castle", emoji: "🏰", price: 150)
