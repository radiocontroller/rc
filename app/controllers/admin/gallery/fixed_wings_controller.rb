module Admin
  module Gallery
    class FixedWingsController < BaseController
      layout 'admin'

      before_action :set_limit, only: [:index]

      def index
        @pictures = GalleryPicture.fixed_wing.order('sort_id asc')
        @category = '固定翼'
      end

      def new
        @picture = GalleryPicture.new
      end

      def create
        picture = GalleryPicture.new(fixed_wing_params)
        picture.category = 'fixed_wing'
        if picture.save
          redirect_to admin_gallery_fixed_wings_path
        else
          @picture = GalleryPicture.new
          render :new
        end
      end

      def update
        current = GalleryPicture.fixed_wing.find(params[:id])
        previous = GalleryPicture.fixed_wing.find_by(sort_id: params[:sort_id])
        previous.update(sort_id: nil) if previous.present?
        current.update(sort_id: params[:sort_id])
        redirect_to admin_gallery_fixed_wings_path
      end

      private

        def fixed_wing_params
          params.require(:gallery_picture).permit(:resource)
        end

        def set_limit
          @limit = 8
        end
    end
  end
end
