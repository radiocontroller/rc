class Devise::SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if user.valid?
      unless user.status
        flash[:notice] = '该帐号未激活，请点击邮件中的链接激活！'
        @user = User.new
        render :new
      else
        if user.valid_password?(params[:user][:password])
          sign_in(:user, user)
          redirect_to 'http://localhost:3000'
        else
          flash[:notice] = '邮箱或密码错误!'
          @user = User.new
          render :new
        end
      end
    else
      flash[:notice] = '邮箱未注册!'
      @user = User.new
      render :new
    end
  end

  def destroy
    user = User.find(current_user.id)
    user.destroy
    redirect_to 'http://localhost:3000'
  end

end
