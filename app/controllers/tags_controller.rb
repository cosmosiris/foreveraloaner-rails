class TagsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post_tag = @post.tags.find_or_create_by(tag_params)

    if @post_tag.save
      redirect_to post_path(@post)
    else
      @errors = @tag.errors.full_messages
      render :new, status: 422
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post_tag = Tag.find(params[:id])
    @post_tag.destroy

    redirect_to posts_path
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
