class UserMailer < ApplicationMailer
  default from: 'from@example.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: 'to@example.com', subject: 'Welcome to My Awesome Site')
  end
end
