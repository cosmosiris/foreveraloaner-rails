require 'rails_helper'

describe Post do
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
    let(:category) { Category.create(name: "Garden") }
    let(:post) { Post.create(title: "Lawn Mower", 
                             description: "Mows your grass", 
                             price: "$40/week", 
                             status: "open", 
                             negotiable: true, 
                             loaner: bob, 
                             category: category)}

  context "when input is valid" do
    it "creates a new post in the database" do
      expect(post).to be_valid
    end

    it "has a title" do
      expect(post.title).to eq "Lawn Mower"
    end

    it "has a description" do
      expect(post.description).to eq "Mows your grass"
    end

    it "has a price" do
      expect(post.price).to eq "$40/week"
    end

    it "has a status" do
      expect(post.status).to eq "open"
    end

    it "has negotiable" do
      expect(post.negotiable).to eq true
    end

    it "has a loaner" do
      expect(post.loaner).to eq bob
    end

    it "has a category" do
      expect(post.category).to eq category
    end
  end

  describe 'validations' do
    it "is invalid without a title" do
      post.title = nil
      expect(post).to be_invalid
    end

    it "is invalid without a description" do
      post.description = nil
      expect(post).to be_invalid
    end

    it "is invalid without a price" do
      post.price = nil
      expect(post).to be_invalid
    end

    it "is invalid without a status" do
      post.status = nil
      expect(post).to be_invalid
    end

    it "is invalid without a loaner" do
      post.loaner = nil
      expect(post).to be_invalid
    end

    it "is invalid without a category" do
      post.category = nil
      expect(post).to be_invalid
    end

    it "is invalid without a status" do
      post.status = nil
      expect(post).to be_invalid
    end
  end

  describe "associations" do
    before(:each) do
      @transaction = Transaction.create(borrower: phyllis,
                                        post: post,
                                        duration: "2 days",
                                        final_price: 50)
      @tag = Tag.create( name: "paper")
      @post_tag = PostTag.create(tag: @tag, post: post) 
    end

    it "belongs to a loaner" do
      expect(post.loaner).to eq bob
    end

    it "belongs to a category" do
      expect(post.category).to eq category
    end

    it "has many shared tags with other posts" do
      expect(post.post_tags).to include(@post_tag)
    end

    it "has many tags" do
      expect(post.tags).to include(@tag)
    end

    it "can be borrowed through a transaction" do
      expect(post.transactions).to include(@transaction)
    end

  end 

  context "Post#search" do
    before(:each) do 
      @book = Post.create(title: "a book",
                          description: "read it lol",
                          price: "50/yourlife",
                          status: "open",
                          negotiable: true,
                          loaner: bob,
                          category: category,
                          location: "91210")
    end 

    it "allows users to search by a post's title" do 
      expect(Post.search("book")).to include(@book)
    end

    it "allows users to search by a post's tags" do 
      expect(Post.in_zips("91210")).to include(@book)
    end 
  end
end
