module Admin
  class BannersController < BaseController
    layout 'admin'
    before_action :set_limit, only: [:index]

    def index
      @banners = BannerPicture.order('sort_id asc')
    end

    def new
      @banner = BannerPicture.new
    end

    def create
      banner = BannerPicture.new(banner_params)
      if banner.save
        redirect_to admin_banners_path
      else
        @banner = BannerPicture.new
        render :new
      end
    end

    def update
      banner = BannerPicture.find(params[:id])
      previous = BannerPicture.find_by(sort_id: params[:sort_id])
      previous.update(sort_id: nil) if previous.present?
      banner.update(sort_id: params[:sort_id])
      redirect_to admin_banners_path
    end

    private

      def banner_params
        params.require(:banner_picture).permit(:resource)
      end

      def set_limit
        @limit = 4
      end
  end
end
