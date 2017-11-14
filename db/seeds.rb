User.destroy_all
Review.destroy_all
Category.destroy_all
Post.destroy_all

borrower = User.create!(first_name: "britt", last_name: "nevins", email:"britt@nevins.com", password: "asdfasdfasdf")
lender = User.create!(first_name: "Olivia", last_name: "Noland", email:"olivia@noland.com", password: "asdfasdfasdf")

categories = ["Accessories", "Baby & Kid Products", "Beauty Products", "Books", "Business & Office Supplies", "Clothing", "DIY Supplies", "Electronics", "Farm & Garden", "Fitness & Sporting Equipment", "Furniture", "Games", "Household Items & Appliances", "Kitchen Appliances", "Luggage & Travel Accessories", "Miscellaneous", "Musical Instruments", "Outdoor Equipment", "Party Supplies", "Tools", "Trailers", "Vehicle & Automotive Parts", "VHS & DVD" ]

categories.map! { |category| Category.create(name: category) }
	categories.each do |category|
	  10.times do
	    post_details = {
	      title: Faker::Commerce.product_name,
	      description: Faker::HarryPotter.quote,
	      price: Faker::Number.decimal(2),
	      status: "open",
	      location: Faker::Address.zip,
	      negotiable: "true",
	      loaner: borrower
	    }
	    category.posts.create!(post_details)
	  end
end

Review.create(rating: 3, body: "great", reviewer: borrower, reviewee: lender, role:"borrower")

categories = ["Accessories", "Baby & Kid Products", "Beauty Products", "Books", "Business & Office Supplies", "Clothing", "DIY Supplies", "Electronics", "Farm & Garden", "Fitness & Sporting Equipment", "Furniture", "Games", "Household Items & Appliances", "Kitchen Appliances", "Luggage & Travel Accessories", "Miscellaneous", "Musical Instruments", "Outdoor Equipment", "Party Supplies", "Tools", "Trailers", "Vehicle & Automotive Parts", "VHS & DVD" ]
categories.each do |category|
  Category.create!(name: category.downcase)
end