class AdminController < Admin::BaseController
  def index
  end

  private

    def set_page_nav
      @page_nav = PageNavCollection.to_nav(
        [
          { name: '后台管理', url: '/admin' },
          { name: Settings.action[request[:action]], end: true }
        ]
      )
    end
end
