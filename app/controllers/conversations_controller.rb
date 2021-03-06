class ConversationsController < ApplicationController
  before_action :authenticate_user!
  include ConversationsHelper

  def new
  end

  def create
    recipients = User.where(id: conversation_params[:recipients])
    conversation = current_user.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation
    flash[:success] = "Your message was successfully sent!"
    redirect_to conversation_path(conversation)
  end

  def reply
    if request.xhr?
      current_user.reply_to_conversation(conversation, params[ :message ][ :body ])
      render partial: "reply", layout: false, locals: { message: params[ :message ], conversation: conversation }
    end
  end

  def show
    @receipts = conversation.receipts_for(current_user)
    # mark conversation as read
    conversation.mark_as_read(current_user)
  end

  def trash
    conversation.move_to_trash(current_user)
    redirect_to mailbox_inbox_path
  end

  def untrash
    conversation.untrash(current_user)
    redirect_to mailbox_inbox_path
  end

  def destroy
    conversation.messages.destroy_all
    conversation.destroy
    redirect_to mailbox_inbox_path
  end

  private

  def conversation_params
    params.require(:conversation).permit(:subject, :body, :recipients)
  end
end
