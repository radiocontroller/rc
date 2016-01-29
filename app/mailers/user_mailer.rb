class UserMailer < ApplicationMailer
  default from: 'zsh302643159@163.com'

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/'
    mail(to: @user.email, subject: '欢迎注册!')
  end

end
