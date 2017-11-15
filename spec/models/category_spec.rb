require 'rails_helper'

describe Category do
  let(:category) { Category.create(name: "Garden") }

  context "if input is valid" do
    it "saves the category to the database" do
      expect(Category.all).to eq [category]
    end

    it "has a name" do
      expect(category.name).to eq "Garden"
    end
  end  
end