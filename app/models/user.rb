class User < ActiveRecord::Base
  after_create :send_email

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  validates_presence_of :email, :password

  validates_uniqueness_of :email

  validates_confirmation_of :password

  private

    def send_email
      UserMailer.welcome_email(self).deliver_now
    end
end
