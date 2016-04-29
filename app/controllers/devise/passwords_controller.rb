class Devise::PasswordsController < Devise::BaseController
  def new
  end

  def create
    if verify_rucaptcha?
      send_reset_password_email
    else
      redirect_to new_user_password_path, alert: '验证码有误'
    end
  end

  def edit
    token = digest_token(self, :reset_password_token, params[:reset_password_token])
    @user = User.find_by(reset_password_token: token)
    redirect_to new_user_password_path, alert: '链接无效,请重新发送邮件' if @user.blank?
  end

  def update
    user = User.find(params[:id])
    user.reset_password(params[:user][:password], params[:user][:password_confirmation])
    if user.errors.present?
      redirect_to new_user_password_path, alert: user.errors.full_messages
    else
      redirect_to new_user_session_path, notice: '密码重置成功'
    end
  end

  private

    def digest_token(user, key, reset_password_token)
      Devise.token_generator.digest(user, key, reset_password_token)
    end

    def send_reset_password_email
      user = User.find_by_email(params[:email])
      if user.present?
        user.send_reset_password_instructions
        redirect_to new_user_session_path, notice: '系统已发送重置密码链接至您的邮箱,请注意查收'
      else
        redirect_to new_user_password_path, alert: '邮箱格式错误或邮箱不存在'
      end
      return
    end
end
