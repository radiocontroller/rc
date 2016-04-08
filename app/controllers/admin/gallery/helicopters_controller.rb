module Admin
  module Gallery
    class HelicoptersController < BaseController
      include GalleryAble

      def chinese_category
        '直升机'
      end

      def english_category
        'helicopter'
      end

    end
  end
end
