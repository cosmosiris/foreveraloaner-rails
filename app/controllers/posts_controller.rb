class PostsController < ApplicationController
  before_action :authenticate_user!

	def index
		search = params[:search]
	    if search
	    	zip_codes = ZipCodeAdapter.zip_search(params[:zip_code], params[:distance])
	      p "*" * 100
	      p params[:search]
	    	p params[:zip_code]
	    	p params[:distance]
	      @posts = Post.in_zips(zip_codes).search(search)
	      p @posts
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
			redirect_to post_path(@post)
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
		@post = Post.find(params[:id])
		@post.update_attributes(post_params)

		if @post.save
			redirect_to post_path(@post)
		else
			@errors = @post.errors.full_messages
			render :edit
		end
	end


	def destroy
		@post = Post.find(params[:id])
		@category = @post.category_id
		@post.destroy
		redirect_to posts_path
	end

	def search
  end

	private

	def post_params
		params.require(:post).permit(:location, :title, :description, :price, :negotiable, :category_id)
	end


end
