class Admin::UsersController < Admin::BaseController
  before_action :set_page_nav

  def index
    @users = User.all
  end

  private

    def set_page_nav
      @page_nav = PageNavCollection.to_nav(
        [
          { name: '后台管理', url: '/admin' },
          { name: '用户模块', url: '/admin/users' },
          { name: name, url: request.path, end: true }
        ]
      )
    end
end
