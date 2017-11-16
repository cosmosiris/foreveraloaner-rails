class Post < ApplicationRecord
	belongs_to 	:loaner, class_name: "User"
	belongs_to 	:category

	has_many  	:post_tags
	has_many	  :tags, through: :post_tags
  has_many 	  :transactions

	validates 	:title, :description, :price, :status, :negotiable, :loaner_id, :category_id, :status, presence: true

  scope :search, -> (search_term) { left_outer_joins(:tags).where('lower(name) LIKE ? OR lower(title) LIKE ?', "%#{search_term.downcase}%", "%#{search_term.downcase}%").distinct.order('id DESC') }
  scope :in_zips, -> (zip_codes) { where(location: zip_codes) }

  # def self.search(search_term)
  #   # by_tag = self.joins(:tags).where('lower(name) LIKE %?% OR lower(title) LIKE %?%', search_term.downcase, search_term.downcase).distinct.order('id DESC')

  #   # by_title = self.where('lower(title) LIKE ?', "%#{search_term.downcase}%").order('id DESC')
  #   # return @search_results << (by_tag | by_title).uniq
  # end

  # def self.find_all_by_zips(zips)
  #   zips.each do |zip|
  #     matched_zips = @search_results.find_by(location: zip)
  #   end
  #   matched_zips
  # end
end
