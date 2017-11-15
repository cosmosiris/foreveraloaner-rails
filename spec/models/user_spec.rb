require 'rails_helper'

describe User do
  let(:bob) { User.create(first_name: "Robert", 
                          last_name: "Vance",
                          bio: "A fungi",
                          phone_number: "888-888-8888",
                          user_name: "BobVance",
                          email:"bob@vancerefridgeration.com",
                          password: "bobvance" )}
  let(:phyllis) { User.create(first_name: "Phyllis",
                              last_name: "Lapin", 
                              bio: "Close your mouth honey, you look like a trout", 
                              phone_number: "111-111-1111",
                              user_name: "EasyRider",
                              email:"mothergoose@dundermifflin.com",
                              password: "phallice" )}
  let(:category) { Category.create(name: "Recreational") }
  let(:post) { Post.create(title: "Idk",
                           description: "Hello",
                           price: 500,
                           location: "Your mom",
                           negotiable: true,
                           category: category,
                           loaner: bob )}

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
      expect(bob.email). to eq "bob@vancerefridgeration.com"
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
    it "can create posts" do 
      expect(bob.posts).to include(post)
    end
  end 


end
