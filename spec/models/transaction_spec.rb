require 'rails_helper'

describe Transaction do 
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

  context "when input is valid" do
    it "creates a new transaction in the database" do
      expect(transaction).to be_valid
    end 
  end 

  describe "has basic attributes" do
    it "has a borrower" do 
      expect(transaction.borrower).to eq phyllis
    end

    it "has a post" do
      expect(transaction.post).to eq post
    end

    it "has a duration" do 
      expect(transaction.duration).to eq "5 days"
    end 

    it "has a final price" do 
      expect(transaction.final_price).to eq 30
    end
  end

  describe "associations" do
    it "has someone who borrows the post" do
      expect(transaction.borrower).to eq phyllis
    end

    it "belongs to a post" do 
      expect(transaction.post). to eq post
    end
  end
end
