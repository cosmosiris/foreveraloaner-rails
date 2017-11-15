require 'rails_helper'

describe User do
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

  context "when input is valid" do
    it "creates a new user in the database" do 
      expect(bob).to be_valid
    end 
  end 

  describe "has basic attributes" do 
    it "has a first name" do
      expect(bob.first_name).to eq "Robert" 
    end 

    it "has a last name" do
      expect(bob.last_name).to eq "Vance"
    end 

    it "has a bio" do
      expect(bob.bio).to eq "A fungi"
    end

    it "has a phone number" do
      expect(bob.phone_number).to eq "888-888-8888"
    end

    it "has a user name" do
      expect(bob.user_name).to eq "BobVance"
    end

    it "has an email" do 
      expect(bob.email). to eq "bob@vancerefrigeration.com"
    end

    it "has a password" do 
      expect(bob.password).to eq "bobvance"
    end 
  
  end 

  describe "validations" do 
    it "is invalid without a first name" do 
      bob.first_name = nil 
      expect(bob).to be_invalid
    end 

    it "is invalid without a last name" do 
      bob.last_name = nil
      expect(bob). to be_invalid
    end 

    it "is invalid without a user name" do 
      bob.user_name = nil
      expect(bob). to be_invalid
    end

    it "is invalid without an email" do
      bob.email = nil
      expect(bob). to be_invalid
    end

    it "is invalid without a password" do
      bob.password = nil
      expect(bob). to be_invalid
    end


  end 

  describe "associations" do
    before(:each) do
      @category = Category.create(name: "Recreational") 
      @post = Post.create(title: "Idk",
                          description: "Hello",
                          price: 500,
                          location: "Dunder Mifflin",
                          negotiable: true,
                          category: @category,
                          loaner: bob )
      @transaction = Transaction.create(borrower: phyllis,
                                        post: @post,
                                        duration: "2 days",
                                        final_price: 50)
      @borrower_review = Review.create(rating: "3",
                                       body: "refrigerator",
                                       reviewer: bob,
                                       reviewee: phyllis,
                                       role:"loaner")
      @loaner_review = Review.create(rating: "3",
                                     body: "paper",
                                     reviewer: phyllis,
                                     reviewee: bob,
                                     role:"borrower")

    end 

    context "loaning items" do  

      it "can list an item for borrow" do 
        expect(bob.posts).to include(@post)
      end

      it "can make a deal with another user to loan an item" do 
        expect(bob.loaner_transactions).to include(@transaction)
      end

      it "has many people they loan items to" do
        expect(bob.users_loaned_to).to include(phyllis)
      end
    end 

    context "borrowing items" do 
      it "can borrow an item" do 
        expect(phyllis.borrowed_posts).to include(@post)
      end 

      it "can make a deal with another user to book an item" do 
        expect(phyllis.borrower_transactions).to include (@transaction)
      end 

      it "has many people they borrow items from" do 
        expect(phyllis.users_loaned_from).to include(bob)
      end
    end 

    context "reviewing borrowers" do
      
      it "can write reviews for people they lend items to" do
        expect(bob.written_loaner_reviews).to include(@borrower_review)
      end

      it "has many people who they review as borrowers" do
        expect(bob.reviewed_borrowers).to include(phyllis)
      end 

      it "has many reviews as a loaner" do
        expect(bob.received_loaner_reviews).to include(@loaner_review)
      end

      it "has many people who review them as a loaner" do
        expect(bob.borrower_reviewers).to include(phyllis)
      end
    end

    context "reviewing loaners" do

      it "can write reviews for people they borrow items from" do
        expect(phyllis.written_borrower_reviews).to include(@loaner_review)
      end

      it "has many people who they borrow items from" do
        expect(phyllis.reviewed_loaners).to include(bob)
      end 

      it "has many reviews as a borrower" do
        expect(phyllis.received_borrower_reviews).to include(@borrower_review)
      end

      it "has many people who review them as a borrower" do
        expect(phyllis.loaner_reviewers).to include(bob)
      end
    end

    context "User#name" do
      
    end

  end 


end
