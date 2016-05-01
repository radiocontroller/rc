class UsersController < BaseController
  layout 'user'
  before_action :set_user

  def show
  end

  def upload
    @user.avatar.remove!
    @user.update(avatar_params)
    redirect_to user_path(@user)
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def avatar_params
      params.require(:user).permit(:avatar)
    end
end
