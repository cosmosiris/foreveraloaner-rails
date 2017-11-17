require 'rails_helper'

describe Review do
  let(:bob) { User.create(first_name: "Robert", 
                          last_name: "Vance",
                          bio: "Bob Vance, of Vance Refrigeration",
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
    before(:each) do
    @bob = User.create(first_name: "Robert",
                    last_name: "Vance",
                    bio: "Bob Vance, of Vance Refrigeration",
                    phone_number: "888-888-8888",
                    user_name: "BobVance",
                    email:"bob@vancerefrigeration.com",
                    password: "bobvance" )

    @phyllis = User.create(first_name: "Phyllis",
                              last_name: "Lapin",
                              bio: "Close your mouth honey, you look like a trout",
                              phone_number: "111-111-1111",
                              user_name: "EasyRider",
                              email:"mothergoose@dundermifflin.com",
                              password: "phallice" )

    @category = Category.create(name: "Garden")

    @post = Post.create(title: "Refrigerator",
                        description: "portable",
                        price: "$20/week",
                        status: "open",
                        zip_code: "18503",
                        city: "Scranton",
                        negotiable: true,
                        category: @category,
                        loaner: @bob)

    @transaction = Transaction.create(borrower: @phyllis,
                                       post: @post,
                                       duration: "5 days",
                                       final_price: 30)

    @borrower_review = Review.create(rating: 4,
                             body: "a good experience",
                             reviewer: @phyllis,
                             reviewee: @bob,
                             role: "borrower")

    @loaner_review =  Review.create(rating: 5,
                             body: "you're a helluva bowler",
                             reviewer: @bob,
                             reviewee: @phyllis,
                             role: "loaner")
    end

    context "basic validations" do
      it "is valid with valid attributes" do
        expect(@borrower_review).to be_valid
      end

    context "valid transaction with custom validation" 
      it "can review a loaner as a borrower if there is a transaction between the two" do
        expect(@borrower_review).to be_valid
      end

      it "can review a borrower as a loaner if there is a transaction between the two" do
        expect(@loaner_review).to be_valid
      end

      it "cannot review a loaner without borrowing something from the loaner" do
        @loaner_review.role = "borrower"
        @loaner_review.valid?
        expect(@loaner_review.errors.full_messages).to match_array ["Cannot review someone you have not borrowed from"]
      end

      it "cannot review a borrower without loaning something to the borrower" do
        @borrower_review.role = "loaner"
        @borrower_review.valid?
        expect(@borrower_review.errors.full_messages).to match_array ["Cannot review someone you have not lent to"]
      end
    end
  end
end