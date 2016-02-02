class Devise::PasswordsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    user.send_reset_password_instructions
    redirect_to new_user_session_path
  end

  def edit
    token = digest_token(self, :reset_password_token, params[:reset_password_token])
    @user = User.find_by(reset_password_token: token)
  end

  def update
    user = User.find(params[:id])
    user.reset_password(params[:password], params[:password_confirmation])
    redirect_to new_user_session_path
  end

  private

    def digest_token(user, key, reset_password_token)
      Devise.token_generator.digest(user, key, reset_password_token)
    end
end
