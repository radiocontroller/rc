class AccountsController < ApplicationController
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
      redirect_to user_path(@user) if @user != current_user
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def user_params
      return {} if params[:user].blank?
      params.require(:user).permit(:avatar)
    end

    def password_params
      params.require(:user).permit(:current_password, :password, :password_confirmation)
    end

    def update_account
      if @user.update(user_params)
        redirect_to edit_user_account_path(@user), notice: '资料修改成功!'
      else
        render :edit
      end
    end

    def update_password
      if @user.update_with_password(password_params)
        sign_in(@user, :bypass => true)
        redirect_to edit_user_account_path(@user), notice: '密码修改成功!'
      else
        render :edit
      end
    end

end
