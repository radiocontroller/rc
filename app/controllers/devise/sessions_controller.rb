class Devise::SessionsController < Devise::BaseController
  before_action :set_user, only: [:create]

  def new
  end

  def create
    if verify_rucaptcha?
      login
    else
      redirect_to new_user_session_path, alert: '验证码有误'
    end
  end

  def destroy
    sign_out(current_user)
    redirect_to root_path
  end

  private

    def set_user
      @user = User.find_by_email(params[:email])
    end

    def login
      status = AuthenticateUserService.call(@user, params[:password])
      if status.success?
        sign_in(@user)
        current_user.timeout_in
        redirect_to root_path
      else
        redirect_to new_user_session_path, alert: status.alert
      end
    end

end
