class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @reviewee = User.find(params[:user_id])
    @review = Review.new(review_params)

    if @review.save
      redirect_to review_path(@review)
    else
      @error = @review.errors.full_messages
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    @reviewee = User.find(params[:user_id])
  end

  def update
    @review = Review.find(params[:id])
    @reviewee = User.find(params[:user_id])
    @review.update_attributes(review_params)

    if @review.save
      redirect_to review_path(@review)
    else
       @error = @review.errors.full_messages
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @reviewee = User.find(params[:user_id])
    @review.destroy

    redirect_to user_path(@reviewee)
  end

  private

    def review_params
      params.require(:review).permit(:body, :rating, :reviewer_id, :reviewee_id, :role)
    end
end