require 'rails_helper'

describe Post do
  before(:each) do 
    @user = User.create(first_name: "Robert", 
                             last_name: "Vance",
                             bio: "A fungi",
                             phone_number: "888-888-8888",
                             user_name: "BobVance",
                             email:"bob@vancerefridgeration.com",
                             password: "bobvance" )
    @category = Category.create(name: "Garden") 
    @mower = Post.create(title: "Lawn Mower", description: "Mows your grass", price: "$40/week", status: "open", negotiable: true, loaner: @user, category: @category)
  end 

  context "when input is valid" do
    it "saves post to the database" do
      expect(Post.all).to eq [@mower]
    end

    it "has a title" do
      expect(@mower.title).to eq "Lawn Mower"
    end

    it "has a description" do
      expect(@mower.description).to eq "Mows your grass"
    end

    it "has a price" do
      expect(@mower.price).to eq "$40/week"
    end

    it "has a status" do
      expect(@mower.status).to eq "open"
    end

    it "has negotiable" do

      expect(@mower.negotiable).to eq true
    end

    it "has a loaner" do
      expect(@mower.loaner).to eq @user
    end

    it "has a category" do
      expect(@mower.category).to eq @category
    end
  end

  # TODO: refactor
  # context "when input is not valid" do
  #   it "does not save post to the database" do
  #     post2 = Post.create(title: "Lawn Mower", description: "Mows your grass", price: "$40/week", status: "open", negotiable: true, category: @category)
  #     post3 = Post.create(description: "Mows your grass", price: "$40/week", status: "open", negotiable: true, category: category)
  #     expect(Post.all).to match_array([@mower])
  #   end
  # end

  context "Post#search" do
    before(:each) do 
      @book = Post.create(title: "a book",
                          description: "read it lol",
                          price: "50/yourlife",
                          status: "open",
                          negotiable: true,
                          loaner: @user,
                          category: @category)
    end 

    it "allows users to search by post title" do 
      expect(Post.search("book")).to include(@book)
    end

    it "allows users to search by a post's tags" do 

    end 

    it "returns posts that can match by tag or by title" do 
      # have a post tagged with "book"
      # have a post titled "book"
      # expect method to return both
    end 
  end
end
