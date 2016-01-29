class Devise::ConfirmationsController < ApplicationController
  def show
    user = User.find_by_confirmation_token(params[:confirmation_token])
    user.update(status: true)
    redirect_to user_session_path
  end
end
