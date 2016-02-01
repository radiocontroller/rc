class User < ActiveRecord::Base
  # after_create :send_email

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  private

    def send_email
      Mailer.welcome_email(self).deliver_now
    end

    # 取消devise默认发送邮件
    def send_confirmation_instructions
      false
    end
end
