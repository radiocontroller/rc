module Admin
  class BannersController < BaseController
    layout 'admin'
    before_action :set_limit, only: [:index]

    def index
      @banners = BannerPicture.order('sort_id asc').page(params[:page] || 1).per_page(page_num)
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
      redirect_to admin_banners_path
    end

    private

      def banner_params
        params.require(:banner_picture).permit(:resource)
      end

      def set_limit
        @limit = 3
      end

      def page_num
        12
      end

  end
end
