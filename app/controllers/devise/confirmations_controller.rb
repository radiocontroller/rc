class Devise::ConfirmationsController < ApplicationController
  def show
    user = User.find_by_confirmation_token(params[:confirmation_token])
    user.update(status: true, confirm_at: Time.now)
    redirect_to user_session_path
  end
end
