module Admin
  module Gallery
    class GlidersController < BaseController
      layout 'admin'

      before_action :set_limit, only: [:index]

      def index
        @pictures = GalleryPicture.glider.order('sort_id asc')
        @category = '滑翔机'
      end

      def new
        @picture = GalleryPicture.new
      end

      def create
        picture = GalleryPicture.new(glider_params)
        picture.category = 'glider'
        if picture.save
          redirect_to admin_gallery_gliders_path
        else
          @picture = GalleryPicture.new
          render :new
        end
      end

      def update
        current = GalleryPicture.glider.find(params[:id])
        previous = GalleryPicture.glider.find_by(sort_id: params[:sort_id])
        previous.update(sort_id: nil) if previous.present?
        current.update(sort_id: params[:sort_id])
        redirect_to admin_gallery_gliders_path
      end

      private

        def glider_params
          params.require(:gallery_picture).permit(:resource)
        end

        def set_limit
          @limit = 8
        end
    end
  end
end
