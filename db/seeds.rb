User.destroy_all
Review.destroy_all
Category.destroy_all
Post.destroy_all
Tag.destroy_all

borrower = User.create!(first_name: "britt", last_name: "nevins", email:"britt@nevins.com", password: "asdfasdfasdf")
loaner = User.create!(first_name: "Olivia", last_name: "Noland", email:"olivia@noland.com", password: "asdfasdfasdf")
third = User.create!(first_name: "Roger", last_name: "Li", email: "noneofyour@business.com", password: "asdfasdf")

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
	      loaner: loaner
	    }
	    category.posts.create!(post_details)
	  end
end

Transaction.create(borrower: borrower, post: Post.all.sample, duration: "3 days", final_price: 10)
p third.users_loaned_from
Review.create(rating: 3, body: "great", reviewer: third, reviewee: loaner, role:"borrower")

categories = ["Accessories", "Baby & Kid Products", "Beauty Products", "Books", "Business & Office Supplies", "Clothing", "DIY Supplies", "Electronics", "Farm & Garden", "Fitness & Sporting Equipment", "Furniture", "Games", "Household Items & Appliances", "Kitchen Appliances", "Luggage & Travel Accessories", "Miscellaneous", "Musical Instruments", "Outdoor Equipment", "Party Supplies", "Tools", "Trailers", "Vehicle & Automotive Parts", "VHS & DVD" ]
categories.each do |category|
  Category.create!(name: category.downcase)
end

# tagsss
posts = Post.all
posts.each do |post|
	post.tags.create(name: "hiking")
	post.tags.create(name: "camping")
	post.tags.create(name: "sports")
	post.tags.create(name: "exercise")
	post.tags.create(name: "equipment")
	post.tags.create(name: "beach")
	post.tags.create(name: "tools")
	post.tags.create(name: "tent")
	post.tags.create(name: "travel")
end





