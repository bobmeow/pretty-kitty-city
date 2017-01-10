###User seeds
User.create(username: "jmpann", name: "Josh", password: 'abc123')
User.create(username: "rachlovescats", name: "Rachel", password: '12345')
User.create(username: "kk_antoin", name: "Antoin", password: 'abcde')
User.create(username: "jj", name: "Jing", password: 'qwerty')
User.create(username: "bobmeow", name: "Bob", password: 'asdfg')
User.create(username: 'icandy', name: "Ian", password: 'coffeedad')
User.create(username: 'fitnessguru', name: "Yomi", password: 'iloveworkingout')

###Pet seeds
rufus = Pet.create(name: "Rufus", mood_level: 5, owner_id: 1)
benecc = Pet.create(name: "Benedict CumberCat", mood_level: 5, owner_id: 2)
tiger = Pet.create(name: "Tiger", mood_level: 5, owner_id: 3)
kitty_purry = Pet.create(name: "Kitty Purry", mood_level: 5, owner_id: 4)
coffee_cat = Pet.create(name: "Coffee Cat", mood_level: 5, owner_id: 5)
scary_spice = Pet.create(name: "Scary Spice Baby Kat", mood_level: 5, owner_id: 6)
cheddar_cat = Pet.create(name: "Cheddar Cat", mood_level: 5, owner_id: 7)

###Seeding Friends of Cats
rufus.people_friends << [User.find(2), User.find(3), User.find(4)]
benecc.people_friends << [User.find(3), User.find(6)]
tiger.people_friends << [User.find(1), User.find(4)]
kitty_purry.people_friends << [User.find(2), User.find(7)]
coffee_cat.people_friends << [User.find(2), User.find(3), User.find(4), User.find(6), User.find(7)]
scary_spice.people_friends << [User.find(2), User.find(1)]
cheddar_cat.people_friends << [User.find(5), User.find(3), User.find(6)]
