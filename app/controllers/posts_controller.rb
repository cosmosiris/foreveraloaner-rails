class PostsController < ApplicationController
  before_action :authenticate_user!

	def index
		search_term = params[:term]

		@posts = Post.all

		if params[:zip_code].length > 0
			params[:distance] = 10 if params[:distance].blank?
	    	zip_codes = ZipCodeAdapter.zip_search(params[:zip_code], params[:distance])
			@posts = @posts.in_zips(zip_codes)
		end

		@posts = @posts.search(search_term) if search_term

		@errors = ["No results found, ensure that your zipcode is real"] if @posts.empty?  
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
			redirect_to new_post_path, status: 422
		end
	end

	def show
		@post = Post.find(params[:id])
		@tag = Tag.new
		@transaction = Transaction.new
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

	

	private

	def post_params
		params.require(:post).permit(:zip_code, :city, :title, :description, :price, :negotiable, :category_id, :status, :image)
	end

	def search_params
		params.require(:search).permit(:keyword)
 	end

end
