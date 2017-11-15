 class PostTagsController < ApplicationController

	def destroy
		p params
	    @post_tag = PostTag.find_by(tag_id: params[:id], post_id: params[:post_id])
	    @post_tag.destroy

	    redirect_to post_path(params[:post_id])
	end

end