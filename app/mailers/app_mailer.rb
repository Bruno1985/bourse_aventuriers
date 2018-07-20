class AppMailer < ActionMailer::Base
  default from: "no-reply@adventurer.com"

  def new_message(user)
     mail(to: @user.email, subject: 'Vous avez un nouveau message')
  end
end