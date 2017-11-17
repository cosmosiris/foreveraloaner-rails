require 'rails_helper'

describe Category do
  let(:category) { Category.create(name: "Kitchen Appliances") }

  let(:bob) { User.create(first_name: "Robert", 
                          last_name: "Vance",
                          bio: "Bob Vance, of Vance Refrigeration",
                          phone_number: "888-888-8888",
                          user_name: "BobVance",
                          email:"bob@vancerefrigeration.com",
                          password: "bobvance" )}
  
  let(:post) { Post.create(title: "Refrigerator",
                           description: "portable",
                           price: "$20/week",
                           status: "open",
                           zip_code: "18503",
                           city: "Scranton",
                           negotiable: true,
                           category: category,
                           loaner: bob )}

  describe "has basic attributes" do
    it "has a name" do 
      expect(category.name).to eq "Kitchen Appliances"
    end 
  end

  describe "validations" do
    it "is invalid without a name" do
      category.name = nil
      expect(category).to be_invalid
    end 
  end

  describe "associations" do
    it "has many posts" do
      expect(category.posts).to include(post)
    end      
  end
end

  
