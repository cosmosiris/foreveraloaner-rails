require 'rails_helper'

describe Review do
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


  # context "when input is valid" do
  #   it "creates a new review in the database if the author borrowed an item from the loaner" do 
  #     expect(review).to be_valid
  #   end
  # end
  describe "has basic attributes" do
    it "has a rating" do 
      expect(review.rating).to eq 4
    end

    it "has a body" do
      expect(review.body).to eq "a good experience"
    end

    it "is written by a reviewer" do 
      expect(review.reviewer).to eq phyllis
    end

    it "is reviews a reviewee" do
      expect(review.reviewee).to eq bob
    end

    it "specifies a role for the author" do
      expect(review.role).to eq "borrower"
    end
  end

  describe "associations" do 
    it "belongs to a reviewer" do
      expect(review.reviewer).to eq phyllis
    end

    it "belongs to a reviewee" do
      expect(review.reviewee).to eq bob
    end
  end

  describe "validations" do 
    it "is invalid if the reviewer "
  end 
end