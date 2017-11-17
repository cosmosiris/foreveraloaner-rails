require 'rails_helper'

describe Post do
    let(:bob) { User.create(first_name: "Robert", 
                            last_name: "Vance",
                            bio: "Bob Vance, of Vance Refrigeration",
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

    let(:post) { Post.create(title: "Refrigerator",
                             description: "portable",
                             price: "$20/week",
                             status: "open",
                             zip_code: "18503",
                             city: "Scranton",
                             negotiable: true,
                             category: category,
                             loaner: bob )}

  context "when input is valid" do
    it "creates a new post in the database" do
      expect(post).to be_valid
    end

    it "has a title" do
      expect(post.title).to eq "Refrigerator"
    end

    it "has a description" do
      expect(post.description).to eq "portable"
    end

    it "has a price" do
      expect(post.price).to eq "$20/week"
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

    it "is invalid without including negotiable" do
      post.negotiable = nil
      expect(post).to be_invalid
    end
  end

  describe "associations" do
    before(:each) do
      @transaction = Transaction.create(borrower: phyllis,
                                        post: post,
                                        duration: "2 days",
                                        final_price: 50)

      @tag = Tag.create(name: "mini-fridge")

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
      @fridge = Post.create(title: "Refrigerator",
                            description: "portable",
                            price: "$20/week",
                            status: "open",
                            zip_code: "18503",
                            city: "Scranton",
                            negotiable: true,
                            category: category,
                            loaner: bob )

      @tag = Tag.create(name: "mini-fridge")

      @post_tag = PostTag.create(tag: @tag, post: @fridge) 
  end 

    it "allows users to search posts by title with a search term" do 
      expect(Post.search("refrigerator")).to include(@fridge)
    end

    it "allows users to search posts by tags with a search term" do
      expect(Post.search("mini")).to include(@fridge)
    end

    it "returns posts by zipcode" do 
      expect(Post.in_zips("18503")).to include(@fridge)
    end 
  end
end
