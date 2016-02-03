class Devise::RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    User.create(user_params)
    redirect_to new_user_session_path, notice: '系统已经发送一封验证邮件,请注意查收'
  end

  private

    def user_params
      params.require(:user).permit(
        :email,
        :password,
        :password_confirmation
      )
    end
end
