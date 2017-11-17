require 'rails_helper'

describe PostTag do
  let(:category) { Category.create(name: "Garden") }
  let(:bob) { User.create(first_name: "Robert", 
                          last_name: "Vance",
                          bio: "A fungi",
                          phone_number: "888-888-8888",
                          user_name: "BobVance",
                          email:"bob@vancerefrigeration.com",
                          password: "bobvance" )} 
  let(:post) { Post.create(title: "Refrigerator",
                           description: "portable",
                           price: "$20/week",
                           status: "open",
                           zip_code: "18503",
                           city: "Scranton",
                           negotiable: true,
                           category: category,
                           loaner: bob )}
  let(:tag) { Tag.create( name: "mini-fridge")}
  let(:post_tag) { PostTag.create(tag: tag , post: post )}
  
  context "when input is valid" do
    it "creats a new tag for a post in the database" do
      expect(post_tag).to be_valid
    end
  end

  describe "has basic attributes" do 
    it "has a tag" do
      expect(post_tag.tag).to eq tag
    end

    it "has a post" do
      expect(post_tag.post).to eq post
    end
  end

  describe "associations" do
    it "belongs to a tag" do 
      expect(post_tag.tag).to eq tag
    end

    it "belongs to a post" do 
      expect(post_tag.post).to eq post
    end  
  end

  describe "uniqueness" do
    before(:each) do
      @existing_post_tag = PostTag.create(tag_id: tag.id, post_id: post.id) 
      @post_tag = PostTag.create(tag_id: tag.id, post_id: post.id)
    end

      it "is invalid if its tag id is the same as another tag id in that post" do 
        expect(@post_tag).to be_invalid  
      end
    end
  end 
