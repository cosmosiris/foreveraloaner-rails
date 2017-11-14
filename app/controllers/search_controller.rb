class SearchController < ApplicationController
  def index
    @posts = Post.where(['lower(title) LIKE ?', "%#{params[:query].downcase}%"])
    render json: @posts
  end
end
