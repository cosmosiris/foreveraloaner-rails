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

#Farm and Garden
Post.create!(title: "100 Series John Deere Lawn Mower", description: "You can borrow my 2016 100 Series John Deere riding mower and it is in great condition and can mow 1/3 of an acre up to 2 acres.", price: "$100/day", status: "open", zip_code: "98116", city: "Seattle", negotiable: true, loaner_id: 1, category: farm_and_garden)
Post.create!(title: "Just Your Average Garden Hoe", description: "Thick blade with sharp edge for strength and clean cuts, fiberglass handle", price: "$5/day", status: "open", zip_code: "18929", city: "Jamison", negotiable: false, loaner_id: 2, category: farm_and_garden)
Post.create!(title: "18 inch 40.2cc Gas Chainsaw", description: "Professional-grade 18 in. bar cuts up to 36 in. diameter logs.", price: "$70/day", status: "open", zip_code: "98116", city: "Seattle", negotiable: false, loaner_id: 3, category: farm_and_garden)
Post.create!(title: "Leaf Blower", description: "Cordless jet fan leaf blower", price: "$50/day", status: "open", zip_code: "18929", city: "Jamison", negotiable: true, loaner_id: 4, category: farm_and_garden)
Post.create!(title: "Pressure Washer", description: "Electric pressure washer, lightweight and compact. Lightly used.", price: "$40/day", status: "open", zip_code: "98116", city: "Seattle", negotiable: false, loaner_id: 3, category: farm_and_garden)

#Party Supplies
Post.create!(title: "Refillable Helium Tank", description: "Great for filling up balloons for your kid's birthday party. Comes empty.", price: "$5/day", status: "open", zip_code: "98116", city: "Seattle", negotiable: true, loaner_id: 5, category: party_supplies)
Post.create!(title: "Tiki Torches (6)", description: "Crowd pleaser for your next tropically themed party.  Great condition!", price: "$5/day", status: "open", zip_code: "18929", city: "Jamison", negotiable: false, loaner_id: 2, category: farm_and_garden)
Post.create!(title: "18 inch 40.2cc Gas Chainsaw", description: "Professional-grade 18 in. bar cuts up to 36 in. diameter logs.", price: "$70/day", status: "open", zip_code: "98116", city: "Seattle", negotiable: false, loaner_id: 3, category: farm_and_garden)
Post.create!(title: "Leaf Blower", description: "Cordless jet fan leaf blower", price: "$50/day", status: "open", zip_code: "18929", city: "Jamison", negotiable: true, loaner_id: 4, category: farm_and_garden)
Post.create!(title: "Pressure Washer", description: "Electric pressure washer, lightweight and compact. Lightly used.", price: "$40/day", status: "open", zip_code: "98116", city: "Seattle", negotiable: false, loaner_id: 3, category: farm_and_garden)


