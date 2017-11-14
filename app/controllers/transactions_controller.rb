class TransactionsController < ApplicationController

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @post = Post.find(params[:post_id])

    if @transaction.save
      redirect_to post_path(@post)
    else
      @errors = @transaction.errors.full_messages
      render :new, status: 422
    end
  end

  def edit
    @transaction = Transaction.new(transaction_params)
    @post = Post.find(params[:post_id])
  end

  def update
    @transaction = Transaction.find(:id)
    @post = Post.find(params[:post_id])
    @transaction.update_attributes(transaction_params)

    if @transaction.save
      redirect_to post_path(@post)
    else
      @errors = @transaction.errors.full_messages
      render :edit
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:duration, :final_price)
  end
end
