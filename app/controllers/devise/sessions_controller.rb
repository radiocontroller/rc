class Devise::SessionsController < ApplicationController
  before_action :set_user, only: [:create]

  def new
  end

  def create
    status = AuthenticateUserService.call(@user, params[:password])
    if status.success?
      sign_in(@user)
      # ...
    else
      redirect_to new_user_session_path, notice: status.notice
    end
  end

  def destroy
    sign_out(current_user)
    # ...
  end

  private

    def set_user
      @user = User.find_by_email(params[:email])
    end

end
