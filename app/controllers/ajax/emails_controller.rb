module Ajax
  class EmailsController < ApplicationController
    def index
      user = User.find_by_email(params[:email])
      if user.present?
        render json: { status: false, notice: '邮箱已存在!' }
      else
        render json: { status: true, notice: '该邮箱暂未注册，可以使用!' }
      end
    end
  end
end
