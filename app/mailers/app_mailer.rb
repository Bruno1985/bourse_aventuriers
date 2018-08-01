class AppMailer < ActionMailer::Base
  default from: "no-reply@adventurer.com"

  def new_message(conversation, message)
      @user = User.find(conversation.recipient_id)
      @message = message
      @conversation = conversation
      mail(to: @user.email, subject: 'Vous avez un nouveau message !')
  end
end