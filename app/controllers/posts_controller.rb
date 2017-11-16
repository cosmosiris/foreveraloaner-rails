class PostsController < ApplicationController
  before_action :authenticate_user!

	def index
		search = params[:search]
	    if search
	      	@posts = Post.search(search)
	    else
			@posts = Post.all
	    end
	end

	def new
		@post = Post.new
		@categories = Category.all
	end

	def create
		@categories = Category.all
		@post = current_user.posts.new(post_params)


		if @post.save
			redirect_to post_path(@post), notice: "Post was successfully created"
		else
			@errors = @post.errors.full_messages
			render :new, status: 422
		end
	end

	def show
		@post = Post.find(params[:id])
		@tag = Tag.new
	end

	def edit
		@post = Post.find(params[:id])
		@categories = Category.all
	end

	def update
		p post_params
		@categories = Category.all
		@post = Post.find(params[:id])
		@post.update_attributes(post_params)

		if @post.save
			redirect_to post_path(@post), notice: "Post was successfully updated"
		else
			@errors = @post.errors.full_messages
			render :edit
		end
	end


	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to categories_path, notice: "Post was successfully destroyed"
	end

	def search
  end

	private

	def post_params
		params.require(:post).permit(:location, :title, :description, :price, :negotiable, :category_id, :status, :image)
	end


end
