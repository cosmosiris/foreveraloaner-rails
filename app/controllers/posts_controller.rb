class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to post_path(@post)
		else
			@errors = @post.errors.full_messages
			render :new
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update_attributes(post_params)

		if @post.save
			redirect_to post_path(@post)
		else
			@errors = @post.errors.full_messages
			render :edit
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def destroy
		@post = Post.find(params[:id])
		@category = @post.category_id
		@post.destroy
		redirect_to posts_path 
	end

	private

	def post_params
		params.require(:post).permit(:location, :title, :description, :price, :negotiable, :loaner_id, :category_id)
	end


end