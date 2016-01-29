class Devise::RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    User.create!(user_params.merge(username: 'xxxxx'))
    redirect_to new_user_session_path
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
