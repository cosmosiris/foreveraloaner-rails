require 'rails_helper'

describe Post do
  let(:user) { User.create(first_name: "bob", last_name: "bob", bio: "A fun guy", phone_number: "888-888-8888", email: "bob@bob.com", password: "bobby123") }
  let(:category) { Category.create(name: "Garden") }
  let(:post) { Post.create(title: "Lawn Mower", description: "Mows your grass", price: "$40/week", status: "open", negotiable: true, loaner: user, category: category) }

  context "when input is valid" do
    it "saves post to the database" do
      expect(Post.all).to eq [post]
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
      expect(post.loaner).to eq user
    end

    it "has a category" do
      expect(post.category).to eq category
    end
  end

  context "when input is not valid" do
    it "does not save post to the database" do
      post2 = Post.create(title: "Lawn Mower", description: "Mows your grass", price: "$40/week", status: "open", negotiable: true, category: category)
      post3 = Post.create(description: "Mows your grass", price: "$40/week", status: "open", negotiable: true, category: category)
      expect(Post.all).to eq [post]
    end
  end
end
