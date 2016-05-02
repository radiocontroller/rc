class AccountsController < BaseController
  layout 'account'
  before_action :set_user
  before_action :verify_user

  def edit
  end

  def update
    if params[:by].present?
      update_password
    else
      update_account
    end
  end

  private

    def verify_user
      redirect_to user_path(@user) if @user.id != current_user.try(:id)
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def user_params
      params.require(:user).permit(:username, :avatar)
    end

    def password_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    def update_account
      avatar = @user.avatar
      if @user.update(user_params)
        avatar.remove!
        redirect_to edit_user_account_path(@user), notice: '资料修改成功!'
      else
        redirect_to edit_user_account_path(@user), alert: @user.errors.full_messages
      end
    end

    def update_password
      redirect_to edit_user_account_path(@user) and return if !@user.valid_password?(params[:user][:current_password])
      @user.update(password_params)
      redirect_to edit_user_account_path(@user)
    end

end
