class SearchController < ApplicationController
  def index
    @categories = Category.where(['name LIKE ?', "%#{params[:query].downcase}%"])
    render json: @categories
  end
end
