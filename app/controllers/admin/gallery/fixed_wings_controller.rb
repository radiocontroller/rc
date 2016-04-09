module Admin
  module Gallery
    class FixedWingsController < BaseController
      include GalleryAble
      layout 'admin'

      def chinese_category
        '固定翼'
      end

      def english_category
        'fixed_wing'
      end

    end
  end
end
