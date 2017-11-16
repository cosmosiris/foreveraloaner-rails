require 'rails_helper'

describe Tag do
  let(:bob) { User.create(first_name: "Robert", 
                            last_name: "Vance",
                            bio: "A fungi",
                            phone_number: "888-888-8888",
                            user_name: "BobVance",
                            email:"bob@vancerefrigeration.com",
                            password: "bobvance" )}
  let(:phyllis) { User.create(first_name: "Phyllis",
                                last_name: "Lapin", 
                                bio: "Close your mouth honey, you look like a trout", 
                                phone_number: "111-111-1111",
                                user_name: "EasyRider",
                                email:"mothergoose@dundermifflin.com",
                                password: "phallice" )}
  let(:category) { Category.create(name: "Garden") }
  let(:post) { Post.create(title: "Lawn Mower", 
                         description: "Mows your grass", 
                         price: "$40/week", 
                         status: "open", 
                         negotiable: true, 
                         loaner: bob, 
                         category: category)}
  let(:transaction) { Transaction.create(borrower: phyllis,
                                         post: post,
                                         duration: "5 days",
                                         final_price: 30)}
  let(:review) { Review.create(rating: "4",
                               body: "a good experience",
                               reviewer: phyllis,
                               reviewee: bob,
                               role: "borrower")}
  let(:tag) { Tag.create(name:"outdoor") }

  context "when input is valid" do 
    it "creates a new tag in the database" do
      expect(tag).to be_valid
    end
  end

  describe "has basic attributes" do
    it "has a name" do
      expect(tag.name).to eq "outdoor"
    end
  end

  describe "validations" do 
    it "is invalid without a name" do
      tag.name = nil
      expect(tag).to be_invalid
    end
  end 

  describe "associations" do
    it "has many tags in a post" do
      expect(tag.post_tags).to include(post)
    end

    it "has many posts through tags" do
      expect(tag.posts).to include (post)
    end
  end



end