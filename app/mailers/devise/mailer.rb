class Devise::Mailer < Devise.parent_mailer.constantize
  include Devise::Mailers::Helpers
  default from: 'zsh302643159@163.com'

  # def welcome_email(user)
  #   @user = user
  #   mail(to: @user.email, subject: '欢迎注册!')
  # end

  def confirmation_instructions(record, token, opts={})
    @email = record.email
    @resource = record
    @token = token
    devise_mail(record, :confirmation_instructions, opts)
  end

  def reset_password_instructions(record, token, opts={})
    @token = token
    devise_mail(record, :reset_password_instructions, opts)
  end

  def unlock_instructions(record, token, opts={})
    @token = token
    devise_mail(record, :unlock_instructions, opts)
  end

  def password_change(record, opts={})
    devise_mail(record, :password_change, opts)
  end
end
