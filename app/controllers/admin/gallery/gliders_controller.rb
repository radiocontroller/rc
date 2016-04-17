module Admin
  module Gallery
    class GlidersController < BaseController
      include GalleryAble
      layout 'admin'

      def chinese_category
        '滑翔机'
      end

      def english_category
        'glider'
      end

    end
  end
end