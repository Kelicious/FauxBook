class ConversationsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @conversations = current_user.mailbox.conversations
  end

  def show
    @conversation = Conversation.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
  end

  def create
    recipient = User.find(params[:user_id])
    current_user.send_message(recipient, params[:body], params[:subject])
    flash[:success] = "Message sent!"
    redirect_to root_url
  end
end
