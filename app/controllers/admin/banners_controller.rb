class Admin::BannersController < Admin::BaseController
  before_action :set_limit, only: [:index, :new]

  def index
    @banners = BannerPicture.normal.order('sort_id asc').page(params[:page] || 1).per_page(page_num)
  end

  def new
    @banner = BannerPicture.new
  end

  def create
    banner = BannerPicture.new(banner_params)
    if banner.save
      redirect_to admin_banners_path, notice: '上传成功!'
    else
      redirect_to new_admin_banner_path, alert: banner.errors.full_messages
    end
  end

  def update
    banner = BannerPicture.find(params[:id])
    BannerPicture.find_by(sort_id: params[:sort_id]).try(:empty_order!)
    banner.update(sort_id: params[:sort_id])
    redirect_to admin_banners_path, notice: '排序成功!'
  end

  private

    def banner_params
      params.require(:banner_picture).permit(:resource, :sort_id)
    end

    def set_limit
      @limit = 3
    end

    def page_num
      12
    end

    def set_page_nav
      @page_nav = PageNavCollection.to_nav(
        [
          { name: '后台管理', url: '/admin' },
          { name: '首页大图模块', url: '/admin/banners' },
          { name: Settings.action[request[:action]], end: true }
        ]
      )
    end

end
