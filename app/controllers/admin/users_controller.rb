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
      params[:q] ||= {}
      @search = {
        username: params[:q][:username_cont],
        email: params[:q][:email_cont],
        start_time: params[:q][:created_at_gteq],
        end_time: params[:q][:created_at_lteq]
      }
      params[:q][:created_at_gteq] = params[:q][:created_at_gteq].try(:to_time)
      params[:q][:created_at_lteq] = params[:q][:created_at_lteq].try(:to_time).try(:end_of_day)
    end

    def set_user_quantity
      @user_quantity = User.count
    end

    def page_num
      15
    end
end
