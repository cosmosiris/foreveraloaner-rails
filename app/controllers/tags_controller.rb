class TagsController < ApplicationController

  def new
    @tag = Tag.new
  end

  def create
    @post = Post.find(params[:tag][:post_id])
    @tag = Tag.find_or_create_by(name: params[:tag][:name])
    @post_tag = @post.post_tags.new(tag: @tag)
    if @post_tag.save
      redirect_to post_path(@post)
    else
      errors = ["This tag is already associated with your post"]
      redirect_to post_path(@post)
    end
  end

  private

end
