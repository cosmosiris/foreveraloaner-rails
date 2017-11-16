class ConversationsController < ApplicationController
  def index
    @conversations = current_user.mailbox.conversations
  end

  def show
    @conversation = current_user.mailbox.conversations.find(params[:id])
  end

  def new
    @recipients = User.all - [current_user]
    p @recipients
    p "*" * 50
  end

  def create
    @recipient = User.find_by(user_name: params[:user_name])
    receipt = current_user.send_message(@recipient, params[:body], params[:subject])
    redirect_to conversation_path(receipt.conversation)
  end
end
















