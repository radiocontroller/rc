module Admin
  module Gallery
    class FpvsController < BaseController
      layout 'admin'

      before_action :set_limit, only: [:index]

      def index
        @pictures = GalleryPicture.fpv.order('sort_id asc')
        @category = '固定翼'
      end

      def new
        @picture = GalleryPicture.new
      end

      def create
        picture = GalleryPicture.new(fpv_params)
        picture.category = 'fpv'
        if picture.save
          redirect_to admin_gallery_fpvs_path
        else
          @picture = GalleryPicture.new
          render :new
        end
      end

      def update
        current = GalleryPicture.fpv.find(params[:id])
        previous = GalleryPicture.fpv.find_by(sort_id: params[:sort_id])
        previous.update(sort_id: nil) if previous.present?
        current.update(sort_id: params[:sort_id])
        redirect_to admin_gallery_fpvs_path
      end

      private

        def fpv_params
          params.require(:gallery_picture).permit(:resource)
        end

        def set_limit
          @limit = 8
        end
    end
  end
end
