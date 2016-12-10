class Admin::AccessLogsController < Admin::BaseController
  def index
    @access_logs = AccessLog.distinct(:created_at)
                      .order('created_at desc')
                          .page(params[:page] || 1).per_page(page_num)
    @access_quantity = AccessLog.count
  end

  private

    def set_page_nav
      @page_nav = PageNavCollection.to_nav(
        [
          { name: '后台管理', url: '/admin' },
          { name: '日志模块', url: '/admin/access_logs' },
          { name: Settings.action[action_name], end: true }
        ]
      )
    end

    def page_num
      15
    end
end
