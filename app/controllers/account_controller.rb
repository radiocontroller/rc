class AccountController < BaseController
  layout 'account'
  before_action :set_user

  def index
  end

  def edit
  end

  def upload
    @user.avatar.remove!
    @user.update(avatar_params)
    redirect_to user_account_path(@user)
  end

  private

    def set_user
      @user = User.find(params[:user_id])
    end

    def avatar_params
      params.require(:user).permit(:avatar)
    end
end
