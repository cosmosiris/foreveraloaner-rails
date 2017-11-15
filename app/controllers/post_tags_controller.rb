 class PostTagsController < ApplicationController

	def destroy
	    @post_tag = PostTag.find(params[:id])
	    @post = Post.find(@post_tag.post_id)
	    @post_tag.destroy

	    redirect_to posts_path(@post)
	end

end