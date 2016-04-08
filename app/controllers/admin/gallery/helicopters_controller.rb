module Admin
  module Gallery
    class HelicoptersController < BaseController
      layout 'admin'

      before_action :set_limit, only: [:index]

      def index
        @pictures = GalleryPicture.helicopter.order('sort_id asc')
        @category = '滑翔机'
      end

      def new
        @picture = GalleryPicture.new
      end

      def create
        picture = GalleryPicture.new(helicopter_params)
        picture.category = 'helicopter'
        if picture.save
          redirect_to admin_gallery_helicopters_path
        else
          @picture = GalleryPicture.new
          render :new
        end
      end

      def update
        current = GalleryPicture.helicopter.find(params[:id])
        previous = GalleryPicture.helicopter.find_by(sort_id: params[:sort_id])
        previous.update(sort_id: nil) if previous.present?
        current.update(sort_id: params[:sort_id])
        redirect_to admin_gallery_helicopters_path
      end

      private

        def helicopter_params
          params.require(:gallery_picture).permit(:resource)
        end

        def set_limit
          @limit = 8
        end
    end
  end
end
