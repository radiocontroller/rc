class Admin::UsersController < Admin::BaseController
  before_action :set_search_value, :set_user_quantity, only: [:index]

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
          { name: Settings.action[request[:action]], url: request.path, end: true }
        ]
      )
    end

    def set_search_value
      @username = (params[:q] || {})[:username_cont]
    end

    def set_user_quantity
      @user_quantity = User.count
    end

    def page_num
      15
    end
end
