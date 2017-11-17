User.destroy_all
Review.destroy_all
Category.destroy_all
Post.destroy_all
Tag.destroy_all
PostTag.destroy_all


example_user = User.create!(first_name: "Olivia", last_name: "Nolan", email:"olivia@nolan.com", bio: "I am just a simple girl with a love of loaning things! I love long walks on the beach and curling up with a good book! Please take my things and use them! They are all in great condition and I take care of everything. Do not hesitate to contact me about any of my postings.", user_name: "liv", password: "password")
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


hoe = Post.create!(title: "Just Your Average Garden Hoe", description: "Thick blade with sharp edge for strength and clean cuts, fiberglass handle. We started are vegetable garden's by clearing out area's and then use the Hoe to clean out the area's. It removed rocks, roots and other things without any problems. It saved us a lot of time and was light and easy to work with because of the metal fabrication and the wooden handle. We've had it for 60 days and also used it to make the rolls in our Garden's. I would recommend maybe creating a serrated edge one the edge instead of a smooth edge. We STILL recommend this Hoe very highly. ", price: "$5/day", status: "open", zip_code: "18929", city: "Jamison", negotiable: false, loaner_id: 2, category: farm_and_garden)
hoe.tags.create!(name: "gardening")
hoe.tags << garden
hoe.tags.create!(name: "hoe")
hoe.tags.create!(name: "sharp")


chainsaw = Post.create!(title: "18 inch 40.2cc Gas Chainsaw", description: "Professional-grade 18 in. bar cuts up to 36 in. diameter logs. It's a good, torque-rich saw that bites in and stays with the cut, no matter how tough it gets. Part of the reason for that is the saw makes its full horsepower (4.0 hp) at a couple hundred lower rpm than the other saws, so it's not working as hard. This saw features the new STIHL M-Tronic onboard microprocessor, which digitally monitors and automatically compensates for changes in your work conditions including elevation, temperature, fuel quality, and dirty air filters. Say goodbye to manual adjustments.", price: "$70/day", status: "open", zip_code: "98116", city: "Seattle", negotiable: false, loaner_id: 3, category: farm_and_garden)
chainsaw.tags.create!(name: "chainsaw")
chainsaw.tags.create!(name: "chopping")
chainsaw.tags << tools


leaf_blower = Post.create!(title: "Leaf Blower", description: "Cordless jet fan leaf blower. In our four years of leaf blower testing, the Worx is the most powerful electric blower that we’ve used. In fact it’s more powerful than a lot of the gas blowers we’ve used. The strong air stream is able to easily get under dense, damp, matted leaves, lift them, and move them forward. At under 6½ pounds, the Worx is almost two pounds lighter than the next lightest corded model we tested, and several pounds lighter than similar handheld gas models.", price: "$50/day", status: "open", zip_code: "18929", city: "Jamison", negotiable: true, loaner_id: 1, category: farm_and_garden)
leaf_blower.tags.create(name: "leaf blower")
leaf_blower.tags.create(name: "fall tools")
leaf_blower.tags << tools
leaf_blower.tags.create(name: "cordless")


pressure_washer = Post.create!(title: "Pressure Washer", description: "Electric pressure washer, lightweight and compact. Lightly used. Pressure washers are great for removing deep-seated dirt, grease, peeling paint and even graffiti from concrete, asphalt, siding, decks, lawn furniture, garbage cans, boats and trailers, and outdoor power equipment. Electric models can remove light stains and dirt from concrete but may not have enough oomph for the heavy stains, according to pressure washer reviews.", price: "$40/day", status: "open", zip_code: "98116", city: "Seattle", negotiable: false, loaner_id: 3, category: farm_and_garden)
pressure_washer.tags << tools
pressure_washer.tags.create!(name: "lightweight")
pressure_washer.tags.create!(name: "pressure washer")
pressure_washer.tags.create!(name: "compact")

#Party Supplies
party = Tag.create!(name: "party")

tank = Post.create!(title: "Refillable Helium Tank", description: "Great for filling up balloons for your kid's birthday party. Comes empty. Perfect for birthdays, graduations, weddings, baby showers, game day, school events, fundraisers and more, the Balloon Time Standard Helium Kit gives you the convenience of filling balloons anytime, anywhere to instantly transform an everyday space into a celebration. The standard helium tank fills up to (30) 9” latex balloons, (16) 11” latex balloons or (16) 18” foil/mylar balloons in just three easy steps. Latex balloons will float approximately 5-7 hours. Foil/mylar balloons will float up to four days. Temperature and altitude will affect helium float time.", price: "$5/day", status: "open", zip_code: "98116", city: "Seattle", negotiable: true, loaner_id: 5, category: party_supplies)
tank.tags << party
tank.tags.create!(name: "helium tank")
tank.tags.create!(name: "balloons")

tiki = Post.create!(title: "Tiki Torches (6)", description: "Crowd pleaser for your next tropically themed party.  Great condition!These easy to assemble torches make any outdoor space special and party ready. Use them for birthdays, engagements, romantic dinners and more! Beautiful decor item that gives ambiance to any patio or garden.", price: "$5/day", status: "open", zip_code: "18929", city: "Jamison", negotiable: false, loaner_id: 2, category: party_supplies)
tiki.tags << party
tiki.tags.create!(name: "tiki torch")
tiki.tags.create!(name: "tropical")
tiki.tags.create!(name: "hawaiian")

tent = Post.create!(title: "Party Tent for 20 People. xcellent canopy. Setup was a breeze, though patience while unfolding is important to make sure you don't stress any joints. Once the canopy is fully stretched out it feels sturdy and wind resistant. Though you must tether it down or use weighs if you want to leave it out. The fabric is very nice quality and looks nice. It's a slight off white grayish color which, in my opinion, looks much better than a bright white. The cover has reinforcements at joints don't doesn't wear out, which is a good thought by the manufacturer. One recommendation would be to put a folded paper towel piece at the joints where the screws come in contact with the canopy polyester. This will prevent the screw from causing a wear hole as the fabric rubs against it. I did it a bit later after I saw the wear hole (see attached pictures). It is a perfect canopy for your patio.", description: "Plain white party tent for your next event, clean and easy to setup.", price: "$100/day", status: "open", zip_code: "98116", city: "Seattle", negotiable: true, loaner_id: 3, category: party_supplies)
tent.tags << party
tent.tags.create!(name: "tent")
tent.tags.create!(name: "large tent")
tent.tags.create!(name: "party tent")

keg = Post.create!(title: "Empty Beer Keg", description: "1/2 barrel empty beer keg ready to be filled with your favorite beer. A good kegerator is the key to fresh, frosty, tasty beer. You might be more familiar with the term Beer Keg Dispenser but now ‘kegerator’ has become a universal word! A kegerator is basically a fridge, drill, tap, faucet, hose, CO2 tank, CO2 regulator and a detachable keg. While it’s possible for the handyman to build their own", price: "$80/day", status: "open", zip_code: "18929", city: "Jamison", negotiable: true, loaner_id: 4, category: party_supplies)
keg.tags << party
keg.tags.create!(name: "beer")
keg.tags.create!(name: "keg")
keg.tags.create!(name: "barrel")

disco = Post.create!(title: "Disco Ball", description: "Large disco ball for your 70's themed party. The Lava the Original Multi-colored Disco Ball creates a stunning display to compliment any party. It constantly rotates a full 360 degrees, casting colorful designs around the room. LED lights give this item a big light effect. The Disco Ball is a great way to get the party started and is easy to take on the go! For over fifty years, the iconic Lava the Original brand has been the pioneer in novelty and conventional lighting products, and today it stands as one of the most recognized, trusted, and beloved brands of all time. At Lava the Original, our commitments to pursuing the latest fashion trends, cutting-edge technology, and unsurpassed quality ensure that we continue to intrigue our older fans while enticing the younger generation with our exciting new product lines. So whether you are six or sixty, we have a Lava the Original lamp product just right for setting the mood of your life.", price: "$10/day", status: "open", zip_code: "18929", city: "Jamison", negotiable: false, loaner_id: 1, category: party_supplies)
disco.tags << party
disco.tags.create!(name: "dance")
disco.tags.create!(name: "70s")
disco.tags.create!(name: "lights")

Transaction.create(borrower: second_user, post: leaf_blower, duration: "3 days", final_price: 10)
Transaction.create(borrower: third_user, post: disco, duration: "3 days", final_price: 5)
Transaction.create(borrower: fourth_user, post: lawn_mower, duration: "3 days", final_price: 50)
Transaction.create(borrower: example_user, post: lawn_mower, duration: "3 days", final_price: 70)
Transaction.create(borrower: second_user, post: disco, duration: "3 days", final_price: 30)
Transaction.create(borrower: example_user, post: tiki, duration: "3 days", final_price: 100)
Transaction.create(borrower: example_user, post: keg, duration: "3 days", final_price: 10)

Review.create(rating: 3, body: "The leaf blower was great and worked wonderfully! My yard was leaf free in less than an hour. However, Olivia was unresponsive when I went to pick the leaf blower up. She would not answer my messages and I ended up waiting for awhile until she finally came to give me the leaf blower. She did apologize though.", reviewer: second_user, reviewee: example_user, role: "borrower")

Review.create(rating: 5, body: "The disco ball was the best part of the party!! Such a great addition and Olivia was so responsive and amazing!", reviewer: third_user, reviewee: example_user, role: "borrower")

Review.create(rating: 1, body: "The lawn mower ended up breaking half way through my yard.", reviewer: fourth_user, reviewee: example_user, role: "borrower")

Review.create(rating: 2, body: "Did not communicate a good time to meet. He ended up showing up early and was upset I made him wait. He did return the leaf blower promptly and in good condition.", reviewee: second_user, reviewer: example_user, role: "loaner")

Review.create(rating: 5, body: "Returned everything back promptly and in wonderful condition. She was courteous and answered quickly.", reviewee: example_user, reviewer: second_user, role: "loaner")

Review.create(rating: 1, body: "Has YET to give me my stuff back after multiple attempts of contact.", reviewee: example_user, reviewer: fourth_user, role: "loaner")














