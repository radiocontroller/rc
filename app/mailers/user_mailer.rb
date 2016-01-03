class UserMailer < ApplicationMailer
  default from: 'zsh302643159@163.com'

  def welcome_email
    @url = 'https://www.baidu.com/'
    mail(to: 'zhuangshunhe@icar99.com', subject: 'xx')
  end
  
end
