class Post < ApplicationRecord
	belongs_to 	:loaner, class_name: "User"
	belongs_to 	:category

	has_many  	:post_tags
	has_many	:tags, through: :post_tags
  	has_many 	:transactions

  	accepts_nested_attributes_for :post_tags

	validates 	:title, :description, :price, :status, :negotiable, :loaner_id, :category_id, presence: true
end
