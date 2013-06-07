class MessagesController < ApplicationController
  def create
    conversation = Conversation.find(params[:conversation_id])
    current_user.reply_to_conversation(conversation, params[:body])
    flash[:success] = "Replied to conversation!"
    redirect_to conversation
  end
end
