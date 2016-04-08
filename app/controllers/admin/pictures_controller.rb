module Admin
  class PicturesController < BaseController
    layout 'admin'

    def index
      q = Picture.ransack(params[:q])
      @pictures = q.result(distinct: true)
      set_categories
    end

    def new
      @picture = Picture.new
      set_categories
    end

    private

      def set_categories
        @categories = Picture::ID_CATEGORIES.invert.to_a
      end

  end
end
