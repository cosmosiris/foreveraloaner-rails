class SearchController < ApplicationController
  def index
    @categories = Category.where(['name LIKE ?', "%#{params[:query].downcase}%"])
    p @categories
    render json: @categories
  end
end
