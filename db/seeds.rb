User.destroy_all
Review.destroy_all
Category.destroy_all
Post.destroy_all
Tag.destroy_all
PostTag.destroy_all


example_user = User.create!(first_name: "Olivia", last_name: "Nolan", email:"olivia@nolan.com", user_name: "liv", password: "password")
second_user = User.create!(first_name: "Gob", last_name: "Bluth", email:"gob@bluth.com", user_name: "gobbluth", password: "password")
third_user = User.create!(first_name: "Bob", last_name: "Loblaw", email:"bob@loblaw.com", user_name: "bobloblaw", password: "password")
fourth_user = User.create!(first_name: "Lucille", last_name: "Bluth", email:"lucille@bluth.com", user_name: "lucillebluth", password: "password")
fifth_user = User.create!(first_name: "Buster", last_name: "Bluth", email:"buster@bluth.com", user_name: "busterbluth", password: "password")

farm_and_garden = Category.create(name: "Farm & Garden")
party_supplies = Category.create(name: "Party Supplies")

categories = ["Accessories", "Baby & Kid Products", "Beauty Products", "Books", "Business & Office Supplies", "Clothing", "DIY Supplies", "Electronics", "Fitness & Sporting Equipment", "Furniture", "Games", "Household Items & Appliances", "Kitchen Appliances", "Luggage & Travel Accessories", "Miscellaneous", "Musical Instruments", "Outdoor Equipment", "Tools", "Trailers", "Vehicle & Automotive Parts", "VHS & DVD" ]

categories.map! { |category| Category.create(name: category) }

garden = Tag.create!(name: "garden")
tools = Tag.create!(name: "tools")
#Farm and Garden
lawn_mower = Post.create!(title: "100 Series John Deere Lawn Mower", description: "You can borrow my 2016 100 Series John Deere riding mower and it is in great condition and can mow 1/3 of an acre up to 2 acres.", price: "$100/day", status: "open", zip_code: "98116", city: "Seattle", negotiable: true, loaner_id: 1, category: farm_and_garden)
lawn_mower.tags.create!(name: "lawn mower")
lawn_mower.tags << garden
lawn_mower.tags.create!(name: "riding mower")
lawn_mower.tags.create!(name: "mow")


hoe = Post.create!(title: "Just Your Average Garden Hoe", description: "Thick blade with sharp edge for strength and clean cuts, fiberglass handle", price: "$5/day", status: "open", zip_code: "18929", city: "Jamison", negotiable: false, loaner_id: 2, category: farm_and_garden)
hoe.tags.create!(name: "gardening")
hoe.tags << garden
hoe.tags.create!(name: "hoe")
hoe.tags.create!(name: "sharp")


chainsaw = Post.create!(title: "18 inch 40.2cc Gas Chainsaw", description: "Professional-grade 18 in. bar cuts up to 36 in. diameter logs.", price: "$70/day", status: "open", zip_code: "98116", city: "Seattle", negotiable: false, loaner_id: 3, category: farm_and_garden)
chainsaw.tags.create!(name: "chainsaw")
chainsaw.tags.create!(name: "chopping")
chainsaw.tags << tools


leaf_blower = Post.create!(title: "Leaf Blower", description: "Cordless jet fan leaf blower", price: "$50/day", status: "open", zip_code: "18929", city: "Jamison", negotiable: true, loaner_id: 1, category: farm_and_garden)
leaf_blower.tags.create(name: "leaf blower")
leaf_blower.tags.create(name: "fall tools")
leaf_blower.tags << tools
leaf_blower.tags.create(name: "cordless")


pressure_washer = Post.create!(title: "Pressure Washer", description: "Electric pressure washer, lightweight and compact. Lightly used.", price: "$40/day", status: "open", zip_code: "98116", city: "Seattle", negotiable: false, loaner_id: 3, category: farm_and_garden)
pressure_washer.tags << tools
pressure_washer.tags.create!(name: "lightweight")
pressure_washer.tags.create!(name: "pressure washer")
pressure_washer.tags.create!(name: "compact")

#Party Supplies
party = Tag.create!(name: "party")

tank = Post.create!(title: "Refillable Helium Tank", description: "Great for filling up balloons for your kid's birthday party. Comes empty.", price: "$5/day", status: "open", zip_code: "98116", city: "Seattle", negotiable: true, loaner_id: 5, category: party_supplies)
tank.tags << party
tank.tags.create!(name: "helium tank")
tank.tags.create!(name: "balloons")

tiki = Post.create!(title: "Tiki Torches (6)", description: "Crowd pleaser for your next tropically themed party.  Great condition!", price: "$5/day", status: "open", zip_code: "18929", city: "Jamison", negotiable: false, loaner_id: 2, category: party_supplies)
tiki.tags << party
tiki.tags.create!(name: "tiki torch")
tiki.tags.create!(name: "tropical")
tiki.tags.create!(name: "hawaiian")

tent = Post.create!(title: "Party Tent for 20 People", description: "Plain white party tent for your next event, clean and easy to setup.", price: "$100/day", status: "open", zip_code: "98116", city: "Seattle", negotiable: true, loaner_id: 3, category: party_supplies)
tent.tags << party
tent.tags.create!(name: "tent")
tent.tags.create!(name: "large tent")
tent.tags.create!(name: "party tent")

keg = Post.create!(title: "Empty Beer Keg", description: "1/2 barrel empty beer keg ready to be filled with your favorite beer.", price: "$80/day", status: "open", zip_code: "18929", city: "Jamison", negotiable: true, loaner_id: 4, category: party_supplies)
keg.tags << party
keg.tags.create!(name: "beer")
keg.tags.create!(name: "keg")
keg.tags.create!(name: "barrel")

disco = Post.create!(title: "Disco Ball", description: "Large disco ball for your 70's themed party.", price: "$10/day", status: "open", zip_code: "18929", city: "Jamison", negotiable: false, loaner_id: 1, category: party_supplies)
disco.tags << party
disco.tags.create!(name: "dance")
disco.tags.create!(name: "70s")
disco.tags.create!(name: "lights")

Transaction.create(borrower: second_user, post: leaf_blower, duration: "3 days", final_price: 10)

Review.create(rating: 3, body: "The leaf blower was great and worked wonderfully! My yard was leaf free in less than an hour. However, Olivia was unresponsive when I went to pick the leaf blower up. She would not answer my messages and I ended up waiting for awhile until she finally came to give me the leaf blower. She did apologize though.", reviewer: second_user, reviewee: example_user, role: "borrower")














