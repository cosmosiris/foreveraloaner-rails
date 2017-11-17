require 'rails_helper'

describe Tag do
    let(:bob) { User.create(first_name: "Robert", 
                          last_name: "Vance",
                          bio: "A fungi",
                          phone_number: "888-888-8888",
                          user_name: "BobVance",
                          email:"bob@vancerefrigeration.com",
                          password: "bobvance" )}
  let(:tag) { Tag.create(name:"cold") }

  context "when input is valid" do 
    it "creates a new tag in the database" do
      expect(tag).to be_valid
    end
  end

  describe "has basic attributes" do
    it "has a name" do
      expect(tag.name).to eq "cold"
    end
  end

  describe "validations" do 
    it "is invalid without a name" do
      tag.name = nil
      expect(tag).to be_invalid
    end
  end

  describe "uniqueness" do
    before(:each) do
      @existing_tag = Tag.create(name: "cold")
    end

    it "is invalid without a unique name" do
      expect(tag).to be_invalid
    end
  end 

  describe "associations" do
    before(:each) do
      @bob = User.create(first_name: "Robert",
                         last_name: "Vance",
                         bio: "Bob Vance, of Vance Refrigeration",
                         phone_number: "888-888-8888",
                         user_name: "BobVance",
                         email:"robert@vancerefrigeration.com",
                         password: "bobvance")
      p "*" * 50
      p @bob.errors.full_messages

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

      @tag = Tag.create(name: "mini")

      @post_tag = PostTag.create(tag: @tag, post: @post)
    end

    it "has many tags in a post" do
      expect(@post.tags).to include (@tag)
    end

    it "has many posts through tags" do
      expect(@tag.posts).to include (@post)
    end
  end
end

