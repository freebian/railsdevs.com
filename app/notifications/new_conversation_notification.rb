class NewConversationNotification < ApplicationNotification
  deliver_by :database
  deliver_by :email, mailer: "AdminMailer", method: :new_conversation

  param :conversation

  def title
    t "notifications.new_conversation",
      name: conversation.business.name,
      company: conversation.business.company,
      developer: conversation.developer.name
  end

  def url
    developer_path(conversation.developer)
  end

  def conversation
    params[:conversation]
  end
end
