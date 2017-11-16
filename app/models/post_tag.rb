class PostTag < ApplicationRecord
	belongs_to	:tag
	belongs_to 	:post

	validates_uniqueness_of :tag_id, :scope => [:post_id]
end
