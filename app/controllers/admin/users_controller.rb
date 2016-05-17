class Admin::UsersController < Admin::BaseController
  before_action :set_search, :set_user_quantity, only: [:index]

  def index
    q = User.ransack(params[:q])
    @users = q.result.order('id desc').page(params[:page] || 1).per_page(page_num)
  end

  private

    def set_page_nav
      @page_nav = PageNavCollection.to_nav(
        [
          { name: '后台管理', url: '/admin' },
          { name: '用户模块', url: '/admin/users' },
          { name: Settings.action[action_name], end: true }
        ]
      )
    end

    def set_search
      @search = {}
      @search[:username] = params[:q] && params[:q][:username_cont]
    end

    def set_user_quantity
      @user_quantity = User.count
    end

    def page_num
      15
    end
end
