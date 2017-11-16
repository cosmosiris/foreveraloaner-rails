class TransactionsController < ApplicationController

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      redirect_to post_path(@post)
    else
      @errors = @transaction.errors.full_messages
    end
  end

  def edit
    @transaction = Transaction.new(transaction_params)
  end

  def update
    @transaction = Transaction.find(:id)
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
    params.require(:transaction).permit(:duration, :final_price, :borrower, :post)
  end
end
