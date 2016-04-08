module Admin
  class PicturesController < BaseController
    layout 'admin'

    def index
      q = Picture.ransack(params[:q])
      @pictures = q.result(distinct: true)
      @categories = Picture::ID_CATEGORIES.invert.to_a
    end

    def new
      @picture = Picture.new
      @categories = Picture::CATEGORIES.invert.to_a
    end

    def create
      picture = Picture.new(picture_params)
      if picture.save
        redirect_to admin_pictures_path
      else
        redirect_to new_admin_picture_path
      end
    end

    private

      def picture_params
        params.require(:picture).permit(:description, :resource, :category)
      end

  end
end
