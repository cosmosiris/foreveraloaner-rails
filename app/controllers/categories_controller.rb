class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    render json: { categories: @categories }
  end

  def show
    @category = Category.find(params[:id])
    @posts = @category.posts
    render json: { category: @category, posts: @posts }
  end
end
