class SearchController < ApplicationController
  def index
    @posts = Post.search(params[:term])
  end

  def self.search(term)
    if term
      where('lower(title) LIKE ? AND lower(tag) LIKE ?', "%#{params[:term].downcase}%").order('id DESC')
    else
      order('id DESC')
    end
  end


  private

  def search_params
    params.require(:search).permit(:term)
  end
end
