module ConversationsHelper
  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end
end
