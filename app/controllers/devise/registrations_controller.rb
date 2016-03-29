class Devise::RegistrationsController < Devise::BaseController
  def new
    @user = User.new
  end

  def create
    if verify_rucaptcha?
      create_user!
    else
      redirect_to new_user_registration_path, alert: '验证码错误'
    end
  end

  private

    def user_params
      params.require(:user).permit(
        :email,
        :username,
        :password,
        :password_confirmation
      )
    end

    def create_user!
      user = User.new(user_params)
      if user.save
        redirect_to new_user_session_path, notice: '系统已经发送一封验证邮件,请注意查收'
      else
        redirect_to new_user_registration_path, alert: user.errors.full_messages.uniq
      end
    end
end
